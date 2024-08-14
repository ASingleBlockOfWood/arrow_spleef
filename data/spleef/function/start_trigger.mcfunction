scoreboard players enable @s spleef
execute as @s[gamemode=!creative] run tellraw @s {"text": "must be in creative to start spleef"}
execute if score #counter terminate matches 0 run tellraw @s {"text": "cannot start spleef until current game of spleef ends"}
execute as @a[gamemode=creative] if score #counter terminate matches 1 \
    run function spleef:setup/manual_load
scoreboard players set @s spleef 0