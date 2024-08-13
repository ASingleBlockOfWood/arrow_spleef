# check for player death every ticks
execute as @s[gamemode=survival, tag=!dead, scores={deaths=1}] run function spleef:end/on_death

# kill player if they fall below a certain height
# doesnt work properly
execute as @s[gamemode=survival, tag=!dead, scores={deaths=0}] store result score @s player_y_pos \
    run data get entity @s Pos[1]
execute as @s[gamemode=survival, tag=!dead, scores={deaths=0}] if score @s player_y_pos <= #const death_zone \
    run function spleef:end/on_death