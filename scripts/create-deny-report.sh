#!/usr/bin/env bash

cargo deny --format json check all |& cat | jq -s '.'
