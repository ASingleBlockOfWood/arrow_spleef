# prevents running
scoreboard players set #counter terminate 1
scoreboard players set @a deaths 0
scoreboard players set #counter leftalive -1
worldborder center 0 0
worldborder set 59999968
worldborder damage amount 0.2 
gamemode survival @a
effect clear @a night_vision
effect clear @a glowing
teleport @a @n[type=marker, tag=center_marker]
execute as @a run tag @s remove dead
# kill all markers and special entities
kill @e[type=bat, tag=barry]
kill @e[type=marker, tag=build_region_placeholder]
kill @e[type=marker, tag=clear_area_placeholder]
kill @e[type=marker, tag=rotation_holder]
kill @e[type=marker, tag=border_corner]
kill @e[type=marker, tag=center_marker]
kill @e[type=marker, tag=bolt_marker]
kill @e[type=marker, tag=player_spawn]
# clear all timers
schedule clear spleef:timer/bolt_timer
schedule clear spleef:timer/arrow_timer
schedule clear spleef:timer/crossbow_timer
schedule clear spleef:setup/border_shrink
schedule clear spleef:setup/check_build_completion
schedule clear spleef:timer/start_timer
schedule clear spleef:builder/build_region
schedule clear spleef:end/end
schedule clear spleef:cleaner/clear_area
schedule clear spleef:end/firework_loop

tellraw @a {"text":"ending game", "color": "#4120d7" }

