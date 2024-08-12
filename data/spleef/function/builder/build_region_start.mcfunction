tellraw @p [{"text": "deleting build_region_placeholder markers", "color": "green"}]
# delete old markers
execute as @e[type=marker, tag=build_region_placeholder] run kill @s

tellraw @p [{"text": "building zone", "color": "gold"}]
# summon new marker
execute at @p align xyz run summon marker ~ -64 ~ {Tags:[build_region_placeholder]}

scoreboard objectives add build_height dummy
scoreboard objectives add current_height dummy
# set current build height at marker
scoreboard players set #counter current_height -64
execute store result score #counter build_height run data get entity @p Pos[1]
schedule function spleef:builder/build_region 1t
