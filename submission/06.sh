# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
blockhash_243821=$(bitcoin-cli -signet getblockhash 243821)
tx_RBF=$(bitcoin-cli -signet getblock "$blockhash_243821" 2 | jq -r '.tx[] | select(.vin[].sequence < 4294967294) | .txid')
echo $tx_RBF
