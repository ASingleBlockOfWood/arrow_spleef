tellraw @a [{"selector":"@s"}," Has Won"]
scoreboard objectives add firework_ticks dummy
scoreboard players set #counter firework_ticks 16
schedule function spleef:end/end 5s
