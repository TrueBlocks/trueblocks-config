FROM golang:1.19-alpine as builder

RUN apk --no-cache add git nano

WORKDIR /root

# ARG UPSTREAM_VER=v0.44.0-beta
ARG UPSTREAM_VER=develop

RUN git clone -b "${UPSTREAM_VER}" --single-branch --progress --depth 1 \
        https://github.com/TrueBlocks/trueblocks-config.git  && \
        cd trueblocks-config && \
        go build -o server

FROM alpine:latest

RUN apk --no-cache add nano

COPY --from=builder /root/trueblocks-config/server /app/server
COPY --from=builder /root/trueblocks-config/static /app/static

EXPOSE 80

ENTRYPOINT /app/server --static /app/static
