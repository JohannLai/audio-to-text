#!/bin/bash

# 获取项目根目录
PROJECT_ROOT=$(git rev-parse --show-toplevel)

# 运行所有测试脚本
for test_file in $(find "$PROJECT_ROOT" -name "test_*.bats"); do
    bats "$test_file"
done