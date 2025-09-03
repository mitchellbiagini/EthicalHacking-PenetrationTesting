start="1"
end="50"
begin="10.0.5"

for i in $(eval echo "{$start..$end}")
do
fping -a "${begin}.${i}" 2>/dev/null |
grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" >> sweep2.txt
done
