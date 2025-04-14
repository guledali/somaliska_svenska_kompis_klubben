#!/bin/sh

commit_msg_file=$1
commit_msg=$(cat $commit_msg_file)

if ! echo "$commit_msg" | grep -qE "^#[0-9]+" ; then
  echo "❌ ERROR: Invalid commit message format."
  echo "Your commit message MUST start with an issue number (e.g. \"#42\")"
  echo ""
  echo "Example: \"#4 Add user authentication feature\""
  exit 1
fi

exit 0
