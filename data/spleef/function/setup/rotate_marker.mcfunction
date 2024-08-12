$execute as @n[type=marker, tag=center_marker] at @s \
    run tp @s ~ ~ ~ ~$(delta_angle) 0
tellraw @a {"entity": "@e[type=marker, tag=center_marker]", "nbt": "Rotation[0]"}
execute at @n[type=marker, tag=center_marker] run tp @s ^ ^ ^35
execute at @n[type=marker, tag=center_marker] run summon marker ^ ^ ^35 {Tags:[player_spawn]}
