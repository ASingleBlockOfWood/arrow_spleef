tp @s ^ ^ ^5
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace
execute at @e[type=marker, tag=border_corner] at @s[dx=100, dz=100, dy=400] \
    run function spleef:bolt/bolt_recursive