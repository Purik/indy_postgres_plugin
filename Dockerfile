FROM ubuntu:16.04

# Install environment
RUN apt-get update -y && apt-get install -y \
	coreutils \
	wget \
	curl \
	apt-transport-https \
	cargo \
	&& apt-get clean

ADD postgres_storage /postgres_storage
RUN cd /postgres_storage && export CARGO_LOG=trace && cargo build && cp target/debug/*.so /usr/lib && cd / && rm -r /postgres_storage
