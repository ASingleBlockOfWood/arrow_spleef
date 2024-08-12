# i could not care less how this timer function looks
# if this function irks you beyond comprehension write me a formal complaint 
# also orange isnt real o7
execute at @n[type=marker, tag=center_marker] run playsound minecraft:block.note_block.bell master @a ~ ~ ~ 6 1.52
execute if score #counter timer_seconds_left matches 3 run tellraw @a {"text": "3", "color": "red"}
execute if score #counter timer_seconds_left matches 2 run tellraw @a {"text": "2", "color": "#ff7e21"}
execute if score #counter timer_seconds_left matches 1 run tellraw @a {"text": "1", "color": "yellow"}
execute if score #counter timer_seconds_left matches 0 run function spleef:on_build_completion
execute unless score #counter timer_seconds_left matches ..0 run schedule function spleef:timer/start_timer 1s
scoreboard players remove #counter timer_seconds_left 1 