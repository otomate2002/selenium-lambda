#!/bin/bash
set -e

if [[ -d "infra" ]]; then
    cd infra

    npm run cdk deploy -- \
        --context name=${APPLICATION_NAME} \
        --context accountId=975050052132 \
        --context region=eu-north-1 \
        --context apiKey=${API_KEY} \
        --context applicationTag=${APPLICATION_TAG} \
        --all \
        --require-approval never
fi
