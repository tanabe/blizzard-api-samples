#!/bin/bash

# Hearthstone API endpoint
API_ENDPOINT=https://us.api.blizzard.com/hearthstone

LOCALE=en_US

function show_usage() {
cat << EOS
    USAGE:
        call_api.sh [cards <card_id>|metadata|deck]
EOS
}

if [ -z "$ACCESS_TOKEN" ]; then
    echo "No access token."
    exit 1
fi

if [ $# -lt 1 ]; then
    show_usage
    exit 1
fi

case $1 in
cards)
    if [ -z "$2" ]; then
        echo "Please specify card id"
        exit 1
    fi

    CARD_ID=$2
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/cards/${CARD_ID}?locale=${LOCALE}
    ;;
metadata)
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/metadata/classes?locale=${LOCALE}
    ;;
deck)
    DECK_CODE=AAECAQcEHNIC3q0D1LoDDRaQA9QE1Ai9pgP1qAPcqQPdrQOktgOrtgO7uQPAuQOcuwMA
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/deck/${DECK_CODE}?locale=us_US
    ;;
*)
    show_usage
    ;;
esac
