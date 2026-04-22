# what is the coinbase tx in this block 243,834
blockhash_243834=$(bitcoin-cli -signet getblockhash 243834)
coinbase_tx=$(bitcoin-cli -signet getblock "$blockhash_243834" 1 | jq -r '.tx[0]')
echo $coinbase_tx