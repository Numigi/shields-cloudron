ARG VERSION=server-2025-04-03

FROM cloudron/base:5.0.0@sha256:04fd70dbd8ad6149c19de39e35718e024417c3e01dc9c6637eaf4a41ec4e596c AS base

FROM shieldsio/shields:${VERSION} AS app

FROM base AS runner

ENV NODE_ENV=production
WORKDIR /app/code

COPY --from=app ./usr/src/app ./

COPY start.sh /app/pkg/

CMD [ "/app/pkg/start.sh" ]
