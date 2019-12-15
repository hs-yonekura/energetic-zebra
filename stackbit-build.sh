#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df599029a07490012a61178/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df599029a07490012a61178
curl -s -X POST https://api.stackbit.com/project/5df599029a07490012a61178/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5df599029a07490012a61178/webhook/build/publish > /dev/null
