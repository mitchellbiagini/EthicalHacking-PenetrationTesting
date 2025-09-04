#!/bin/bash

hostfile=$1
portfile=$2
set -o pipefail # error handling
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
     if timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
       results+="$host|$port|OPEN\n" # formatted output
     fi
  done
done

echo -e "HOST|PORT|STATUS\n$results" | column -t -s "|"
