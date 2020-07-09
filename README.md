# Blizzard API Samples

Samples for the Blizzard API

## Reference

https://develop.battle.net/

## How to use

### Prerequisites

1. Obtain Client ID and Client Secret from the Blizzard Battle.net Developer Portal.
1. Copy setenv_template.sh to setenv.sh.
1. Open setenv.sh with text editor and fill out secrets.

### Set environment

```
$ source setenv.sh
```

### Obtaining access token

```
$ export ACCESS_TOKEN=`./get_token.sh | jq -r .access_token`
```

### Call api

```
$ ./call_api.sh metadata
```