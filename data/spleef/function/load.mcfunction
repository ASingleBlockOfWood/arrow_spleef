# check if the position is too low to start the minigame safely (store the player position to check for death conditions during gameplay)
scoreboard objectives add death_zone dummy
scoreboard objectives add player_y_pos dummy
scoreboard players set #const death_zone -66

# for the start timer (the height needed to be built is = to the number of ticks until finished building)
scoreboard objectives add min_y dummy
scoreboard players set #const min_y -64
scoreboard objectives add ticks_until_start dummy
execute store result score #counter ticks_until_start run data get entity @p Pos[1]
scoreboard players operation #counter ticks_until_start -= #const min_y

# tells the game when to stop running
scoreboard objectives add terminate dummy
scoreboard players set #counter terminate 0
# define minimum ground thickness
scoreboard objectives add min_ground_thickness dummy
scoreboard players set #const min_ground_thickness 30
# store ground thickness
scoreboard objectives add ground_thickness dummy
execute store result score #counter ground_thickness run data get entity @p Pos[1]
scoreboard players operation #counter ground_thickness -= #const min_ground_thickness

# exit early if player is too low
execute if score #counter ground_thickness matches ..-65 run tellraw @a {"text": "must be above y=-32 to play", "color": "red"}
execute if score #counter ground_thickness matches ..-65 run scoreboard players set #counter terminate 1
execute if score #counter ground_thickness matches ..-65 run return fail

# builds ground
scoreboard objectives add done_building dummy
scoreboard objectives add build_height dummy
scoreboard objectives add current_height dummy

kill @e[type=marker, tag=build_region_placeholder]
execute at @p align xyz run summon marker ~ -64 ~ {Tags:[build_region_placeholder]}

tellraw @a {"text": "building level", "color": "green"} 
scoreboard players set #counter done_building 0
scoreboard players set #counter current_height -64
execute store result score #counter build_height run data get entity @p Pos[1]
schedule clear spleef:builder/build_region 
schedule function spleef:builder/build_region 1t

# prevents final stages of loading until building is complete
schedule clear spleef:check_build_completion
schedule clear spleef:timer/start_timer
schedule function spleef:check_build_completion 1t

# clear 16 blocks up above the ground level
schedule clear spleef:cleaner/clear_area
kill @e[type=marker, tag=clear_area_placeholder]
execute at @p align xyz run summon marker ~ ~17 ~ {Tags:[clear_area_placeholder]}
scoreboard objectives add current_clear_height dummy
scoreboard objectives add end_clear_height dummy
execute store result score #counter current_clear_height \
    run data get entity @n[type=marker, tag=clear_area_placeholder] Pos[1]
execute as @p store result score #counter end_clear_height \
    run data get entity @s Pos[1]
# restructure clear area so it works from a lower y level to a higher y level
schedule function spleef:cleaner/clear_area 1t


# set world size and shrinking timer is set after countdown
execute at @p align xz run worldborder center ~ ~
worldborder set 100
worldborder damage amount 1 

# count total players and store the number left alive
scoreboard objectives add deaths deathCount
scoreboard objectives add leftalive dummy
scoreboard players set @a deaths 0
scoreboard players set #counter leftalive 0
execute as @a run scoreboard players add #counter leftalive 1
# set players deaths to zero
scoreboard players set @a deaths 0
execute as @a run tag @s remove dead

# removing pre-existing center marker make new one
kill @e[type=marker, tag=center_marker]
execute at @p run summon marker ~ ~ ~ {Tags:[center_marker], Rotation:[0f, 0f]}

#store the y-position of the top layer for barry's positioning
scoreboard objectives add top_height dummy
execute store result score #const top_height run data get entity @n[type=marker, tag=center_marker] Pos[1]

# add a marker to the corner for volume detections
kill @e[type=marker, tag=border_corner]
execute at @n[type=marker, tag=center_marker] align xyz run summon marker ~-51 -64 ~-51 {Tags:[border_corner]}

# give players required items and effects (spectator to prevent player death in build phase)
gamemode spectator @a 
effect give @a glowing infinite 1 true
effect give @a night_vision infinite 1 true
give @a bow[enchantments={punch: 10}]
give @a golden_carrot 16
give @a chorus_fruit 4
give @a ender_pearl 1

# for raycast
scoreboard objectives add ray_step dummy

# the marker used to hold rotation of projectiles
kill @e[type=marker, tag=rotation_holder]
summon marker ~ ~ ~ {Tags:[rotation_holder]}

# for bolt code
kill @e[type=marker, tag=bolt_marker]
summon marker ~ ~ ~ {Tags:[bolt_marker]}

# determine the delta angle to spawn players in a circle
scoreboard objectives add delta_angle dummy
# used score=36000 and scale=0.01 to preserve 2 decimal points in the angle
scoreboard players set #const delta_angle 36000
scoreboard players operation #const delta_angle /= #counter leftalive
execute store result storage spleef delta_angle float 0.01 \
    run scoreboard players get #const delta_angle

# rotate the marker and place the players creating a circle of evenly spaced players
kill @e[type=marker, tag=player_spawn]
execute as @a run function spleef:setup/rotate_marker with storage spleef {}
#make the markers face the center
execute as @a at @s facing entity @n[type=marker, tag=center_marker] eyes run tp @s ~ ~ ~ ~ 0

schedule clear spleef:timer/bolt_timer
schedule clear spleef:timer/arrow_timer
schedule clear spleef:timer/crossbow_timer

# for countdown timer
scoreboard objectives add timer_seconds_left dummy
scoreboard players set #counter timer_seconds_left 3

tellraw @a {"text": "Barry the Bat will occasionally drop items; listen for the pings to know when!", "color": "#d63bde"} 

schedule clear spleef:end/end
schedule clear spleef:end/firework_loop