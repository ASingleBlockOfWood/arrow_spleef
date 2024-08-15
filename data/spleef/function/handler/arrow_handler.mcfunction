# append tags to arrows
execute as @s[tag=] run function spleef:handler/arrow_tagger
# maybe add if this file gets big? -> execute as @s[tag=] run return fail

# bolt behavior 
execute as @s[tag=bolt] at @s run function spleef:bolt/bolt_arrow
# standard drill arrow behavior
execute as @s[tag=standard] run function spleef:shotgun_raycast/shotgun_raycast_start

# append future arrow behaviors here

# end of function
execute as @s[tag=!, nbt={inGround:true}] run kill @s

