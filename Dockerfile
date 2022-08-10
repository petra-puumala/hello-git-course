FROM quay.io/petra-puumala/test:latest AS build

RUN mkdir /app
WORKDIR /app

COPY . /app/
FROM quay.io/petra-puumala/test:latest
MAINTAINER PP <petra.puumala@i-mediat.fi>

ENV NODE_ENV production
WORKDIR /app
USER app

COPY --from=build --chown=app:app /app /app
