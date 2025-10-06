#!/bin/bash

tmpdir=$(mktemp -d)
tar -xzf /opt/hw1/datasets.tar.gz -C "$tmpdir" queries.txt features.txt
sort -t $'\t' -k2,2 "$tmpdir/queries.txt" > "$tmpdir/queries_sort.txt"
sort -t $'\t' -k1,1 "$tmpdir/features.txt" > "$tmpdir/features_sort.txt"

join -t $'\t' -1 2 -2 1 "$tmpdir/queries_sort.txt" "$tmpdir/features_sort.txt" | cut -f2,1,4,5