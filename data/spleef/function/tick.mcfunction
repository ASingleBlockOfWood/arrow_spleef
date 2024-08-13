# start game if trigger is used while in creative
scoreboard players enable @a spleef
execute as @a[gamemode=creative] if score #counter terminate matches 1 \
    unless score @s spleef matches 0 \
    run function spleef:setup/manual_load
scoreboard players set @a spleef 0

# end if terminate = true
execute if score #counter terminate matches 1 run return fail

# check for player death every ticks
execute as @a[gamemode=survival, tag=!dead, scores={deaths=1}] run function spleef:end/on_death

# kill player if they fall below a certain height
execute as @a[gamemode=survival, tag=!dead, scores={deaths=0}] store result score @s player_y_pos \
    run data get entity @s Pos[1]
execute as @a[gamemode=survival, tag=!dead, scores={deaths=0}] if score @s player_y_pos <= #const death_zone \
    run function spleef:end/on_death

# execute a function for every arrow that decides what it does
execute at @n[type=marker, tag=border_corner] as @e[type=arrow, dx=100, dz=100, dy=400] at @s \
    run function spleef:arrow_handler


