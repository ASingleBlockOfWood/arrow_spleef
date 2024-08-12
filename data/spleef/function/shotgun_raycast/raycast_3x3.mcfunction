## as @n[type=marker, tag=rotation_holder] | at @n[type=marker, tag=rotation_holder] positioned ^ ^ ^0.5*steps
scoreboard players remove #counter ray_step 1
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace
execute unless score #counter ray_step matches 0 positioned ^ ^ ^0.4 \
    run function spleef:shotgun_raycast/raycast
