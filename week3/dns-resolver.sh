#!/bin/bash

prefix=$1
dns=$2
start="1"
end="254"

echo "DNS Resolution for $prefix"
for i in $(eval echo "{$start..$end}"); do
nslookup "$prefix.$i" "$dns" 2>/dev/null | grep "name"
done
