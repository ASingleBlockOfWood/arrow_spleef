# push barry upward if he gets too low
execute store result score #counter barry_height run data get entity @s Pos[1]
execute if score #counter barry_height <= #const top_height run tp @s ~ ~15 ~
# barry drops a cool arrow
summon item ~ ~ ~ {Glowing:true, Item:{id:arrow, count:2, components:{rarity:"uncommon", custom_name:'"bolt"'}}}
playsound entity.experience_orb.pickup neutral @a ~ ~ ~ 4 2
