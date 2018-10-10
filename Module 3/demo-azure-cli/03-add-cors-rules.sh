#!/bin/bash

# The easiest method to demo is to have individual `az storage cors add` commands
# as shown here. If you wish to read in JSON and then execute az commands, you may
# be better off using a different tool than bash since it's complex
# to transform array elements into command arguments like below.

az storage cors add --services b \
    --origins "http://localhost:5000" \
    --methods "GET" \
    --allowed-headers "x-api-key" \
    --exposed-headers "x-ms-request-id" "x-ms-lease-status" \
    --max-age 10

az storage cors add --services b \
    --origins "http://localhost:5001" \
    --methods "GET" "HEAD" \
    --allowed-headers "content-type" \
    --exposed-headers "x-*" \
    --max-age 5

az storage cors add --services b \
    --origins "http://localhost:5000" "http://localhost:5001" \
    --methods "POST" \
    --allowed-headers "x-api-key" "x-app-*" \
    --exposed-headers "*" \
    --max-age 5

az storage cors add --services b \
    --origins "*" \
    --methods "GET" \
    --allowed-headers "*" \
    --exposed-headers "*" \
    --max-age 30