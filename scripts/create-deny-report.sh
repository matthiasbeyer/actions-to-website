#!/usr/bin/env bash

gitrev="$(git rev-parse HEAD)"
shortrev="$(echo "$gitrev" | head -c 10)"

{
    cargo deny --format json check all ||:
} &> tmpfile

cat tmpfile >&2

jq -n "{\"data\":[inputs],\"rev\":\"${gitrev}\",\"shortrev\":\"${shortrev}\"}" < tmpfile
