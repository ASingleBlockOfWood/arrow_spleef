scoreboard players remove #counter current_clear_height 1
execute as @n[type=marker, tag=clear_area_placeholder] at @s \
    run tp @s ~ ~-1 ~
execute at @n[type=marker, tag=clear_area_placeholder] \
    run fill ~-50 ~ ~-50 ~50 ~ ~50 air replace


execute if score #counter current_clear_height = #counter end_clear_height \ 
    run kill @n[type=marker, tag=clear_area_placeholder] 
execute unless score #counter current_clear_height = #counter end_clear_height \ 
    run schedule function spleef:cleaner/clear_area 1t

