#!/bin/bash

set -u

SCRIPT="starter/solution.sh"
USERNAME="studentuser"

PASSED=0
FAILED=0

pass_test() {
echo "PASS: $1"
PASSED=$((PASSED + 1))
}

fail_test() {
echo "FAIL: $1"
FAILED=$((FAILED + 1))
}

echo "======================================"
echo " Linux User Assignment Test Suite"
echo "======================================"

# Test 1: Check solution file

if [ -f "$SCRIPT" ]; then
pass_test "solution.sh exists"
else
fail_test "solution.sh does not exist"
exit 1
fi

# Test 2: Check Bash syntax

if bash -n "$SCRIPT"; then
pass_test "Bash syntax is valid"
else
fail_test "Bash syntax is invalid"
fi

# Test 3: Check useradd command

if grep -Eq '(^|[^[:alnum:]*])useradd([^[:alnum:]*]|$)' "$SCRIPT"; then
pass_test "useradd command is used"
else
fail_test "useradd command is not used"
fi

# Test 4: Check id command

if grep -Eq '(^|[^[:alnum:]*])id([^[:alnum:]*]|$)' "$SCRIPT"; then
pass_test "id command is used"
else
fail_test "id command is not used"
fi

# Test 5: Check required username

if grep -q "studentuser" "$SCRIPT"; then
pass_test "Required username is used"
else
fail_test "Required username is not used"
fi

# Test 6: Execute student solution

echo
echo "Running student solution..."
echo "--------------------------------------"

if bash "$SCRIPT"; then
pass_test "solution.sh executed successfully"
else
fail_test "solution.sh execution failed"
fi

# Test 7: Check whether user exists

if id "$USERNAME" >/dev/null 2>&1; then
pass_test "User exists"
else
fail_test "User was not created"
fi

# Test 8: Verify UID information

USER_INFO=$(id "$USERNAME" 2>/dev/null || true)

if echo "$USER_INFO" | grep -q "uid="; then
pass_test "UID information is available"
else
fail_test "UID information is missing"
fi

# Test 9: Verify username

if echo "$USER_INFO" | grep -q "(studentuser)"; then
pass_test "Username appears in id output"
else
fail_test "Username does not appear in id output"
fi

# Test 10: Verify GID information

if echo "$USER_INFO" | grep -q "gid="; then
pass_test "GID information is available"
else
fail_test "GID information is missing"
fi

echo
echo "======================================"
echo " Test Summary"
echo "======================================"
echo "Passed: $PASSED"
echo "Failed: $FAILED"

if [ "$FAILED" -eq 0 ]; then
echo
echo "ALL TESTS PASSED"
exit 0
else
echo
echo "SOME TESTS FAILED"
exit 1
fi
