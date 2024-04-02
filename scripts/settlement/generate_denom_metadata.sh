#!/bin/bash

if [ -n "$ROLLAPP_SETTLEMENT_INIT_DIR_PATH" ]; then
  echo "ROLLAPP_SETTLEMENT_INIT_DIR_PATH is not set, using '$HOME/.rollapp_evm/init'"
  ROLLAPP_SETTLEMENT_INIT_DIR_PATH="$HOME/.rollapp_evm/init"
fi

if [ ! -d "$ROLLAPP_SETTLEMENT_INIT_DIR_PATH" ]; then
  mkdir -p "$ROLLAPP_SETTLEMENT_INIT_DIR_PATH"
  echo "Creating the ROLLAPP_SETTLEMENT_INIT_DIR_PATH: $ROLLAPP_SETTLEMENT_INIT_DIR_PATH"
else
  echo "ROLLAPP_SETTLEMENT_INIT_DIR_PATH already exists: $ROLLAPP_SETTLEMENT_INIT_DIR_PATH"
fi

tee "$ROLLAPP_SETTLEMENT_INIT_DIR_PATH/denommetadata.json" >/dev/null <<EOF
[
  {
    "description": "The native staking and governance token of the ${ROLLAPP_CHAIN_ID}",
    "denom_units": [
      {
        "denom": "a${DENOM}",
        "exponent": 0
      },
      {
        "denom": "${DENOM}",
        "exponent": 18
      }
    ],
    "base": "a${DENOM}",
    "display": "${DENOM}",
    "name": "${DENOM}",
    "symbol": "${DENOM}"
  }
]
EOF
set +x