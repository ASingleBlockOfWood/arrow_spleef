# start game if trigger is used while in creative
execute if score #counter terminate matches 1 run scoreboard players enable @a spleef
execute as @a[gamemode=creative] if score #counter terminate matches 1 \
    unless score @s spleef matches 0 \
    run function spleef:setup/manual_load
scoreboard players set @a spleef 0

# end if terminate = true
execute if score #counter terminate matches 1 run return fail

# clear the area around barry
execute at @n[type=bat, tag=barry] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace

# check for player death every ticks
#execute as @a[gamemode=survival, tag=!dead, scores={deaths=1}] run function spleef:end/on_death

# kill player if they fall below a certain height
#execute as @a[gamemode=survival, tag=!dead, scores={deaths=0}] store result score @s player_y_pos \
    run data get entity @s Pos[1]
#execute as @a[gamemode=survival, tag=!dead, scores={deaths=0}] if score @s player_y_pos <= #const death_zone \
    run function spleef:end/on_death

# handles player deaths
execute at @n[type=marker, tag=border_corner] as @a[dx=120, dz=120, dy=400] run function spleef:handler/player_handler

# handles arrow effects 
execute at @n[type=marker, tag=border_corner] as @e[type=arrow, dx=110, dz=110, dy=400] at @s \
    run function spleef:handler/arrow_handler

