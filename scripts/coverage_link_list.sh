#!/usr/bin/env bash

function bail() {
    echo "$*" >&2
    exit 1
}

main_branch_name="$1"
website_base_path="$2"
coverage_subdir="$3"
link_count="${4:-}"

[[ -z "$main_branch_name" ]] && bail "Missing argument: main branch name (ARG 1)"
[[ -z "$website_base_path" ]] && bail "Missing argument: website base path (ARG 2)"
[[ -z "$coverage_subdir" ]] && bail "Missing argument: coverage sub directory (ARG 3)"

if [[ -z "$link_count" ]]; then
    link_count=10
    echo >&2 "Missing argument: link count (ARG 4), setting to ${link_count}"
fi

echo "<table>"
echo "<tr>"
echo "  <th>Date</th>"
echo "  <th>HTML Report</th>"
echo "  <th>lcov</th>"
echo "</tr>"

git log -n "${link_count}" --format="%h %H %cs" --first-parent "${main_branch_name}" | \
    while read -r shorthash hash date;
    do
        linkroot="${website_base_path}/${coverage_subdir}/${hash}"

        echo "<tr>"
        echo "  <th>${date}</th>"
        echo "  <th><a href=\"${linkroot}/html/index.html\">${shorthash}</a></th>"
        echo "  <th><a href=\"${linkroot}/lcov\">lcov</a></th>"
        echo "</tr>"
    done
echo "</table>"

