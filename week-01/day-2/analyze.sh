#!/usr/bin/env bash

LOG="server.log"

echo "== total lines =="
wc -l < "$LOG"

echo "== levels =="
awk '{print $3}' "$LOG" | sort | uniq -c | sort -nr

echo "== errors =="
grep -n ' ERROR ' "$LOG"

echo "== problems =="
grep -vE ' (INFO|DEBUG) ' "$LOG" > problems.txt
cat problems.txt

echo "== top user =="
grep -o 'user=[a-z]*' "$LOG" | sort | uniq -c | sort -nr | head -n 1
