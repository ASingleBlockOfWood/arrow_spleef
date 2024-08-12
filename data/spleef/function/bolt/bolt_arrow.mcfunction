execute store result storage spleef bolt_pitch float -1.0 run data get entity @s Rotation[0]
execute store result storage spleef bolt_yaw float -1.0 run data get entity @s Rotation[1]

execute at @s as @n[type=marker, tag=bolt_marker] run function spleef:bolt/bolt_to_marker
# must destroy the arrow and marker
kill @s
