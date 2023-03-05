#!/usr/bin/env bats

load is_bilibili_url.sh

@test "correct bilibili URL" {
  run is_bilibili_url "https://www.bilibili.com/video/BV1Y7411W7tq"
  [ "$status" -eq 0 ]
}

@test "incorrect bilibili URL" {
  run is_bilibili_url "https://www.bilibili.com/a/BV1Y7411W7tq/"
  [ "$status" -eq 1 ]
}
