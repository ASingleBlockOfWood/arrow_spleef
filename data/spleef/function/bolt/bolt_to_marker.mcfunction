# at arrow as marker
# tp marker to arrow
tp @s ~ ~ ~
data modify entity @s Rotation[0] set from storage spleef bolt_pitch
data modify entity @s Rotation[1] set from storage spleef bolt_yaw
playsound minecraft:entity.ender_dragon.hurt player @a ^ ^ ^3 4 2
playsound minecraft:entity.warden.sonic_boom player @a ^ ^ ^3 4 1
# prevents the player from being dropped into the crater the bolt creates
execute at @s run tp @s ^ ^ ^5
execute as @s at @s run function spleef:bolt/bolt_recursive

scoreboard objectives add height dummy
execute store result score @s height run data get entity @s Pos[1]
# as marker at marker tp to -61
execute if score @s height matches ..-61 as @s at @s align xyz run tp @s ~ -61 ~
execute at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace