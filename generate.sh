#!/bin/bash
echo "# PB2 Weekly Challenges"
cat weeklyChallenges.json | jq -r '.[]|[.week,.payload,.preview,.title]|@tsv' | while IFS=$'\t' read -r w p i t; do
  lvl=layouts/w$(printf "%04d" $w).layout
  img=images/w$(printf "%04d" $w).png
  echo "## $t"
  echo "[![$t](https://raw.githubusercontent.com/Dregu/PB2WC/master/$img)](https://raw.githubusercontent.com/Dregu/PB2WC/master/$lvl)"
done
