#!/bin/sh

echo "🧪 Running Rails tests before pushing..."
bin/rails test
test_status=$?

if [ $test_status -ne 0 ]; then
  echo "❌ ERROR: Tests failed! Fix the tests before pushing."
  exit 1
fi

echo "✅ All tests passed. Pushing changes..."
exit 0
