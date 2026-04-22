# How many new outputs were created by block 243,825?
blockhash=$(bitcoin-cli -signet getblockhash 243825)

new_outputs_243825=$(bitcoin-cli -signet getblock $blockhash 2 | jq -r '[.tx[].vout | length] | add')

echo $new_outputs_243825