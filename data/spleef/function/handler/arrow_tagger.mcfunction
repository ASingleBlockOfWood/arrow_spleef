# appends the required tags to the arrows

execute as @s[nbt={CustomName:'"bolt"'}] run data modify entity @s Tags append value "bolt"
execute as @s[nbt={CustomName:'"drill-tipped arrow"'}] run data modify entity @s Tags append value "standard"

# append future arrow tags here