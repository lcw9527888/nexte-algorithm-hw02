#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
TEST_DIR="$SCRIPT_DIR/tests"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
pass=0
fail=0

check() {
    local test_name="$1"
    local exe_name="$2"
    local input="$TEST_DIR/$test_name.in"
    local expect="$TEST_DIR/$test_name.out"
    local actual="/tmp/${test_name}.actual"
    local exe="$BUILD_DIR/$exe_name"

    if [[ ! -x "$exe" ]] || [[ ! -f "$input" ]] || [[ ! -f "$expect" ]]; then
        echo -e "${RED}[ERROR]${NC} 文件缺失: $exe 或 $input 或 $expect"
        fail=$((fail + 1))
        return
    fi

    "$exe" < "$input" > "$actual"
    if diff -u "$expect" "$actual" > /tmp/test_diff.txt; then
        echo -e "${GREEN}[PASS]${NC} $test_name"
        pass=$((pass + 1))
    else
        echo -e "${RED}[FAIL]${NC} $test_name"
        cat /tmp/test_diff.txt
        fail=$((fail + 1))
    fi
}

echo "========== 开始测试 =========="
check streak_sample streak
check streak_edge1 streak
check streak_edge2 streak
check streak_edge3 streak

check unique_ids_sample unique_ids
check unique_ids_edge1 unique_ids
check unique_ids_edge2 unique_ids
check unique_ids_edge3 unique_ids

check range_sum_sample range_sum
check range_sum_edge1 range_sum
check range_sum_edge2 range_sum
check range_sum_edge3 range_sum

echo "=============================="
echo "测试结果: 通过 $pass 个, 失败 $fail 个"

if [[ $fail -gt 0 ]]; then exit 1; fi
echo -e "${GREEN}所有测试通过！${NC}"
