FROM rust AS build

WORKDIR /app
COPY . .

RUN cargo install

FROM debian:stable-slim

COPY --from=build /usr/local/cargo/bin/ /app/
RUN apt update && apt install -y --no-install-recommends libpq5
ENTRYPOINT [ "/app/show_devices" ]