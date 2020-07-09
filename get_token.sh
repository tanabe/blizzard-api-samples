#!/bin/bash

OAUTH_END_POINT=https://us.battle.net/oauth/token
curl -s -u ${CLIENT_ID}:${CLIENT_SECRET} -d grant_type=client_credentials ${OAUTH_END_POINT}
