# AtCoder 用 Rust プロジェクト Makefile
# 使い方: make help
# Windows: GNU Make が必要 (winget install ezwinports.make / scoop install make)

CARGO ?= cargo
BIN   ?= a
# 入力ファイル。例: make run BIN=b IN=samples/b/1.in
IN    ?= samples/$(BIN)/1.in

.PHONY: help build release run test check fmt fmt-check clippy lint sample clean

help:
	@echo "make build              全 bin をデバッグビルド"
	@echo "make release            全 bin をリリースビルド"
	@echo "make run BIN=a IN=...   release で実行 (標準入力に IN を渡す)"
	@echo "make sample BIN=a       samples/BIN/*.in を実行して出力表示"
	@echo "make test               ライブラリの単体テスト"
	@echo "make check|fmt|clippy   静的チェック / 整形 / lint"
	@echo "make lint               fmt-check + clippy (CI 相当)"
	@echo "make clean              target 削除"

build:
	$(CARGO) build --bins

release:
	$(CARGO) build --release --bins

run:
	$(CARGO) run --release --bin $(BIN) < $(IN)

sample:
	$(CARGO) run --release --bin $(BIN) < $(IN)

test:
	$(CARGO) test --lib

check:
	$(CARGO) check --all-targets

fmt:
	$(CARGO) fmt

fmt-check:
	$(CARGO) fmt -- --check

clippy:
	$(CARGO) clippy --all-targets -- -D warnings

lint: fmt-check clippy

clean:
	$(CARGO) clean
