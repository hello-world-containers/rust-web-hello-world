FROM rustlang/rust:nightly as builder
WORKDIR /usr/src/app
COPY . .
RUN cargo build --release

FROM debian:stretch-slim
COPY --from=builder /usr/src/app/target/release/rust-web-hello-world /bin/
EXPOSE 8000
CMD ["rust-web-hello-world"]