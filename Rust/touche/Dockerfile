FROM rust:1-slim-buster AS build

ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

RUN cargo new --bin fibaas
WORKDIR /fibaas

COPY Cargo.toml /fibaas/
COPY Cargo.lock /fibaas/
RUN cargo build --release

COPY src /fibaas/src
RUN touch src/main.rs
RUN cargo build --release

FROM debian:buster-slim

COPY --from=build /fibaas/target/release/fibaas-touche /fibaas-touche

CMD "/fibaas-touche"
