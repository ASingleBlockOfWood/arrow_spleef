gamemode spectator @s
scoreboard players add @s deaths 1

tag @s add dead
scoreboard players remove #counter leftalive 1
tellraw @a ["There are ", {"score":{"name":"#counter","objective":"leftalive"}}, " players left alive."]

# if only one player is alive then they win
execute if score #counter leftalive matches 1 as @p[scores={deaths=0}] run function spleef:end/victory
# for the cases when both players die at the same time (not sure if its possible, but it is here just in case)
execute if score #counter leftalive matches 0 run tellraw @a [{"color": "#e03d3d", "text":"There are no winners"}]
execute if score #counter leftalive matches 0 as @p run function spleef:end/end
