#!/usr/bin/env bats

load check.sh

@test "check domain 0" {
  run check "www.bilibili.com"
  [ "$status" -eq 1 ]
}

@test "check domain 1" {
  run check "youtube.com"
  [ "$status" -eq 0 ]
}
