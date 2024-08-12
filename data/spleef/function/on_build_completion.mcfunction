tellraw @a {"text": "Start", "color": "green"} 
execute at @n[type=marker, tag=center_marker] run playsound minecraft:block.note_block.bell master @a ~ ~ ~ 6 2
#prepare border closing
tellraw @a {"text": "border will being to close in 100 seconds", "color": "#56ebff"}
schedule clear spleef:setup/border_shrink
schedule function spleef:setup/border_shrink 100s

# barry the bat. he drops items to spice the game up
scoreboard objectives add barry_height dummy
kill @e[type=bat, tag=barry]
execute at @e[type=marker, tag=center_marker] run summon bat ~ ~15 ~ {Tags:[barry], CustomName:'"Barry"', active_effects:[{id:"resistance", amplifier:255, duration:-1}]}

# give players required items and effects
gamemode survival @a

schedule function spleef:timer/bolt_timer 6s
function spleef:timer/arrow_timer
schedule function spleef:timer/crossbow_timer 16s