//! 自作ライブラリ置き場(いわゆる include 相当)。
//!
//! `src/library/` 配下にモジュールを追加し、ここで `pub mod` 宣言する。
//! 各 `src/bin/*.rs` からは `use library::...;` で利用できる。
//! AtCoder へは単一ファイル提出のため、提出前に `cargo-equip` 等でバンドルする。

pub mod library;
