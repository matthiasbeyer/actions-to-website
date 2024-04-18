#!/usr/bin/env bash

coverageLinkList "master" "https://matthiasbeyer.github.io/actions-to-website" "llvmcov" | \
sed -i '/^<!-- LLVM_COV_MARKER -->/{
r /dev/stdin
d}' site/llvmcov.md
