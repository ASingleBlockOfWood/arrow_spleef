execute at @n[type=marker, tag=build_region_placeholder] \
    run fill ~-50 ~ ~-50 ~50 ~ ~50 cyan_concrete replace
execute as @n[type=marker, tag=build_region_placeholder] at @s \
    run tp @s ~ ~1 ~

scoreboard players add #counter current_height 1
execute if score #counter current_height = #counter build_height \
    run scoreboard players set #counter done_building 1
execute if score #counter current_height = #counter build_height \
    run kill @n[type=marker, tag=build_region_placeholder] 
execute unless score #counter current_height > #counter build_height \
    run schedule function spleef:builder/build_region 1t
