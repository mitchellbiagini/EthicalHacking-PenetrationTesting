#!/bin/bash

host=$1
port=$2
start="1"
end="254"
set -o pipefail
for i in $(eval echo "{$start..$end}"); do
  if timeout .1 bash -c "echo >/dev/tcp/$host.$i/$port" 2>/dev/null; then
    results+="$host.$i|$port|OPEN\n" # formatted output
  fi
done

echo -e "HOST|PORT|STATUS\n$results" | column -t -s "|"
