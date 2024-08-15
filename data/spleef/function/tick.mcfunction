# start game if trigger is used while in creative
execute as @a unless score @s spleef matches 0 run function spleef:start_trigger

# end if terminate = true
execute if score #counter terminate matches 1 run return fail

# clear the area around barry
execute at @n[type=bat, tag=barry] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace

# handles player deaths
execute at @n[type=marker, tag=border_corner] as @a[dx=120, dz=120, dy=400] run function spleef:handler/player_handler

# handles arrow effects 
execute at @n[type=marker, tag=border_corner] as @e[type=arrow, dx=110, dz=110, dy=400] at @s \
    run function spleef:handler/arrow_handler

