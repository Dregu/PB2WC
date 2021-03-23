#!/bin/bash
mkdir -p layouts
mkdir -p images
wget https://dfp529wcvahka.cloudfront.net/manifests/weeklyChallenges.json -O weeklyChallenges.json
cat weeklyChallenges.json | jq -r '.[]|[.week,.payload,.preview]|@tsv' | while IFS=$'\t' read -r w p i; do
  f=layouts/w$(printf "%04d" $w).layout
  if [ ! -f $f ]; then
    wget $p -O- | gunzip -d - > $f
  fi
  f=images/w$(printf "%04d" $w).png
  if [ ! -f $f ]; then
    wget $i -O $f
  fi
done
