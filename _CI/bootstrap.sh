#!/bin/bash
set -e

if [[ -d "infra" ]]; then
    cd infra

    echo "Install AWS CDK version ${CDK_VERSION}.."

    npm i -g aws-cdk@${CDK_VERSION}
    npm ci --include=dev

    echo "Synthesize infra.."

    npm run cdk synth -- \
        --quiet \
        --context name=selenium-lambda \
        --context accountId=975050052132 \
        --context region=eu-north-1 \
        --context apiKey=${API_KEY} \
        --context applicationTag=${APPLICATION_TAG}
fi
