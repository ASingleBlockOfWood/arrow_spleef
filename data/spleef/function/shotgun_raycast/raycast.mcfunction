# as @n[type=marker, tag=rotation_holder] | at @n[type=marker, tag=rotation_holder] positioned ^ ^ ^0.5*steps
scoreboard players remove #counter ray_step 1
execute unless block ~ ~ ~ air run fill ~ ~ ~ ~ ~ ~ air replace
execute unless score #counter ray_step matches 0 positioned ^ ^ ^0.5 \
    run function spleef:shotgun_raycast/raycast
# FOR DEBUGGING
#execute unless score #counter ray_step matches 0 rotated ~12 ~ positioned ^ ^ ^0.5 \
    run function spleef:shotgun_raycast/raycast