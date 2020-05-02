#!/bin/bash

# Hearthstone API endpoint
API_ENDPOINT=https://us.api.blizzard.com/hearthstone

LOCALE=en_US

# search card
CARD_ID=678
#curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/cards/${CARD_ID}?locale=${LOCALE}

# fetch deck
DECK_CODE=AAECAQcEHNIC3q0D1LoDDRaQA9QE1Ai9pgP1qAPcqQPdrQOktgOrtgO7uQPAuQOcuwMA
curl --header "Authorization: Bearer ${ACCESS_TOKEN}" ${API_ENDPOINT}/deck/${DECK_CODE}?locale=us_US
