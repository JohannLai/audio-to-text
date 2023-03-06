#!/usr/bin/env bats

load check.sh

@test "Check proxy for https://www.youtube.com/watch?v=QH2-TGUlwu4" {
  run check "https://www.youtube.com/watch?v=QH2-TGUlwu4"
  [ "$output" = "0" ]
}

@test "Check proxy for https://www.bilibili.com" {
  run check "https://www.bilibili.com"
  [ "$output" = "1" ]
}