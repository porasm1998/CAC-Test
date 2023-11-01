vault operator unseal -address="http://localhost:8200" $1

vault login  -address="http://localhost:8200" $2

vault.exe secrets enable -path=$3 -address="http://localhost:8200" kv

# vault write -address="http://localhost:8200" $3 $4

#  vault.exe kv put -address="http://localhost:8200" $3/accode acccode=$4

#  vault.exe kv put -address="http://localhost:8200" $3/acckey acckey=$5

#  vault.exe kv put -address="http://localhost:8200" $3/seckey seckey=$6