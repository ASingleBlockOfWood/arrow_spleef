scoreboard players remove #counter firework_ticks 1
summon firework_rocket ~ ~ ~ {LifeTime:30,FireworksItem:{id:firework_rocket,components:{fireworks:{flight_duration:3,explosions:[{shape:"small_ball",has_trail:1b}]}}}}
execute unless score #counter firework_ticks matches 0 run schedule function spleef:end/firework_loop 5t