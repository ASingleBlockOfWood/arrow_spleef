# tested with the following lines in a main function
#summon armor_stand ~ ~ ~ {Tags:[context_test]}
#execute as @n[type=armor_stand, tag=context_test] \
    run function spleef:context_test

#data modify entity @s Tags append value "done"
#execute as @s[tag=!done] run say bad
#execute as @s[tag=done] run say good
# about output is 'good'
# therefore the context changes with the object

#kill @s
#execute as @s run say should be dead
# above code prints 'should be dead' even after being destroyed
# therefore the @s cannot be changed from within the function it is context for
# rerun to determine if it was said as teh server or as the killed entity

give @s minecraft:tipped_arrow[custom_name='"wind arrow"', potion_contents={custom_effects:[{id: "unluck", amplifier: 100, show_particles:0b, duration: 100}]}] 10
give @s bow[enchantments={multishot:18}]