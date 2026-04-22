# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
tx_ouput="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"
tx_input=$(bitcoin-cli -signet getrawtransaction "$tx_ouput" true | jq -r '.vin[0].txid')

output_value_sats=$(bitcoin-cli -signet getrawtransaction "$tx_ouput" true | jq -r '[.vout[].value] | add * 100000000 | round')
input_value_sats=$(bitcoin-cli -signet getrawtransaction "$tx_input" true | jq -r '.vout[0].value * 100000000 | round')

total_fees_sats=$((input_value_sats - output_value_sats))
echo $total_fees_sats