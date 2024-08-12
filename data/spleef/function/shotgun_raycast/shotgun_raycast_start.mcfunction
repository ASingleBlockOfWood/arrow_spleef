# at @e[type=arrow] | as @e[type=arrow]
execute store result storage spleef arrow_pitch float -1.0 run data get entity @s Rotation[0]
execute store result storage spleef arrow_yaw float -1.0 run data get entity @s Rotation[1]

execute at @s as @n[type=marker, tag=rotation_holder] run function spleef:shotgun_raycast/arrow_to_marker
