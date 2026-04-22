# Which tx in block 216,351 spends the coinbase output of block 216,128?
blockhash_216128=$(bitcoin-cli -signet getblockhash 216128)
coinbase_txid=$(bitcoin-cli -signet getblock $blockhash_216128 1 | jq -r '.tx[0]')
blockhash_216351=$(bitcoin-cli -signet getblockhash 216351)
spending_txid=$(bitcoin-cli -signet getblock $blockhash_216351 2 | jq -r '.tx[] | select(.vin[].txid == "'$coinbase_txid'") | .txid')
echo $spending_txid