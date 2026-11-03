#![allow(unused_imports)]
use itertools::Itertools;
use proconio::{fastout, input, marker::*};

#[fastout]
fn main() {
    input! {
        n: usize,
        a: [i64; n],
    }
    println!("{}", a.iter().sum::<i64>());
}
