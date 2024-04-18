#!/usr/bin/env bash

gitrev="$(git rev-parse HEAD)"
shortrev="$(echo "$gitrev" | head -c 10)"

cargo deny --format json check all |& cat |  jq -n "{\"data\":[inputs],\"rev\":\"${gitrev}\",\"shortrev\":\"${shortrev}\"}"
