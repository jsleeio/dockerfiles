FROM rust:1-stretch AS build

RUN git clone https://github.com/mike-engel/jwt-cli.git /tmp/src
WORKDIR /tmp/src
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=build /tmp/src/target/release/jwt /jwt
ENTRYPOINT ["/jwt"]

