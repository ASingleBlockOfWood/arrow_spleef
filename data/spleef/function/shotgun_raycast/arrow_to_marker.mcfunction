## at @n[type=arrow] | as @n[type=marker, tag=rotation_holder]
tp @s ~ ~ ~

data modify entity @s Rotation[0] set from storage spleef arrow_pitch
data modify entity @s Rotation[1] set from storage spleef arrow_yaw

# raycast layout below where the number represents the raycasts 
#propagated in the angled direction from the marker (center is not rotated)
# 0 1 0
# 1 2 1
# 0 1 0

# middle center 3x3
scoreboard players set #counter ray_step 10
execute at @s run function spleef:shotgun_raycast/raycast_3x3

scoreboard players set #counter ray_step 8
execute at @s rotated ~-10 ~ run function spleef:shotgun_raycast/raycast
scoreboard players set #counter ray_step 10
execute at @s run function spleef:shotgun_raycast/raycast
scoreboard players set #counter ray_step 8
execute at @s rotated ~10 ~ run function spleef:shotgun_raycast/raycast
# top center 1x1
scoreboard players set #counter ray_step 8
execute at @s rotated ~ ~10 run function spleef:shotgun_raycast/raycast
# bottom center 1x1
scoreboard players set #counter ray_step 8
execute at @s rotated ~ ~-10 run function spleef:shotgun_raycast/raycast

