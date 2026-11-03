# Rust-Template (AtCoder)

Windows 11 + PowerShell 7 のターミナルで開発する、AtCoder 向け Rust テンプレート。

## 構成

```
.
├── Cargo.toml            # 依存は AtCoder ジャッジ環境に固定
├── rust-toolchain.toml   # Rust 1.89.0 固定
├── rustfmt.toml
├── Makefile
├── src/
│   ├── bin/a.rs … g.rs   # 問題ごとの提出ファイル (1問 = 1 bin)
│   ├── lib.rs            # 自作ライブラリのルート
│   └── library/          # 再利用コード (include 相当)
└── samples/<問題>/N.in|N.out   # サンプルケース
```

## 使い方

```powershell
make run BIN=a              # samples/a/1.in を入力に実行
make run BIN=b IN=samples/b/2.in
make test                   # library の単体テスト
make lint                   # fmt-check + clippy
```

GNU Make が無い場合: `scoop install make` または `winget install ezwinports.make`。
Make 不要でも `cargo run --release --bin a < samples/a/1.in` で同じ(PowerShell では `Get-Content samples/a/1.in | cargo run --release --bin a`)。

## 注意

- 依存バージョンは AtCoder の言語アップデート一覧で要確認(一次資料: <https://img.atcoder.jp/file/language-update/language-list.html>)。
- 提出は単一ファイル。`src/library` を使う場合は `cargo-equip` 等でバンドルする。
