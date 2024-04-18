#!/usr/bin/env bash

function bail() {
    echo "$*" >&2
    exit 1
}

main_branch_name="$1"
website_base_path="$2"
coverage_subdir="$3"

[[ -z "$main_branch_name" ]] && bail "Missing argument: main branch name (ARG 1)"
[[ -z "$website_base_path" ]] && bail "Missing argument: website base path (ARG 2)"
[[ -z "$coverage_subdir" ]] && bail "Missing argument: coverage sub directory (ARG 3)"

git log --format="%H %cs" --first-parent "${main_branch_name}" | \
    while read -r hash date;
    do
        linkroot="${website_base_path}/${coverage_subdir}/${hash}"
        echo "* [${date} ${hash}](${linkroot}/html/index.html) ([lcov](${linkroot}/lcov))"
    done

