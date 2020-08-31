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
    if [ -z "$3" ]; then
        echo "Please specify card id"
        exit 1
    fi

    LOCALE=$2
    CARD_ID=$3
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/cards/${CARD_ID}?locale=${LOCALE}
    ;;
metadata)
    LOCALE=$2
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/metadata/classes?locale=${LOCALE}
    ;;
deck)
    LOCALE=$2
    DECK_CODE="AAECAR8etQPhBIoHlwjbCfyjA+SkA6alA/KlA4SnA4qtA4utA/muA/yvA/6vA4ewA+ewA/ewA/+wA4exA4ixA5GxA9iyA6K3A6+3A4O5A6K5A/+6A9e+A+W+AwAA"
    curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/deck/${DECK_CODE}?locale=${LOCALE}
    ;;
*)
    show_usage
    ;;
esac