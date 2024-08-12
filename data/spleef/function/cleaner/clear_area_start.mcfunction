tellraw @p [{"text": "deleting clear_area_placeholder markers", "color": "green"}]
kill @e[type=marker, tag=clear_area_placeholder]
tellraw @p [{"text": "clearing zone", "color": "gold"}]
execute at @p align xyz run summon marker ~ ~-1 ~ {Tags:[clear_area_placeholder]}
scoreboard objectives add start_clear_height dummy
scoreboard objectives add end_clear_height dummy
execute as @p store result score #counter start_clear_height run data get entity @s Pos[1]
scoreboard players set #counter end_clear_height -64
schedule function spleef:cleaner/clear_area 1t
