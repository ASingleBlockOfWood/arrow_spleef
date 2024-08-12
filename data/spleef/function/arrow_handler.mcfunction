
execute as @s[nbt={CustomName:'"bolt"'}] run data modify entity @s Tags append value "bolt"
execute as @s[tag=bolt] at @s run function spleef:bolt/bolt_arrow
execute as @s[tag=bolt] at @s run return 1

execute as @s[tag=] run data modify entity @s Tags append value "standard"
execute as @s[tag=standard] run function spleef:shotgun_raycast/shotgun_raycast_start
#execute as @s[tag=standard] run return 1


# make the arrow invulnerable
#execute as @s[nbt={Invulnerable:false}] run data modify entity @s Invulnerable set value true

# end of function
execute as @s[nbt={inGround:true}] run kill @s

