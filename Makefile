.PHONY: release
release: target/wasm32-wasip1/release/espejote-plugin-rust.wasm
	# Requires `oras` to be installed: https://oras.land/docs/install/
	# Requires `ghcr.io` to be logged in: `oras login ghcr.io`
	## Create personal access token with `write:packages` scope
	oras push --annotation "org.opencontainers.image.source=https://github.com/bastjan/espejote-plugin-rust" ghcr.io/bastjan/espejote-plugin-rust:reactor target/wasm32-wasip1/release/espejote-plugin-rust.wasm:application/vnd.module.wasm.content.layer.v1+wasm

target/wasm32-wasip1/release/espejote-plugin-rust.wasm:
	cargo build --release
