tp @s ^ ^ ^5
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace
# only stops when the bounds are exceeeded
execute at @e[type=marker, tag=border_corner] at @s[dx=110, dz=110, dy=400] \
    run function spleef:bolt/bolt_recursive