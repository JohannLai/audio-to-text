#!/usr/bin/env bats

load check.sh

@test "check domain 0" {
  run check "https://www.bilibili.com/video/BV1rv4y1W7Ja/?spm_id_from=333.1007.tianma.1-2-2.click"
  [ "$status" -eq 1 ]
}

@test "check domain 1" {
  run check "youtube.com"
  [ "$status" -eq 0 ]
}
