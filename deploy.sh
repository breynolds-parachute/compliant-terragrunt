#!/usr/bin/env bash

set -x

target_environment=$1

cd terragrunt

exclude_environments=($(ls | grep -v common | grep -v $target_environment))

terragrunt run-all apply ${exclude_environments[@]/#/--terragrunt-exclude-dir ./}

