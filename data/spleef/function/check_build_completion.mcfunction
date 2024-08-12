# prevent the player from moving from the designated postion upon start
execute as @e[type=marker, tag=player_spawn] at @s run tp @p ~ ~ ~
# fix the line below because it triggers too many times 
execute if score #counter timer_seconds_left matches 3 if score #counter ticks_until_start matches ..35 \
    run function spleef:timer/start_timer
execute unless score #counter done_building matches 1 run schedule function spleef:check_build_completion 1t
scoreboard players remove #counter ticks_until_start 1 
# check ticks to determine when to start timer
# activate when ticks left are 20
