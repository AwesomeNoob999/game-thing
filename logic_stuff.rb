def generate
rooms = ["start_room","nowwwww", "e"]
doors = rand(1..5)
puts "there #{if doors== 1 then "is" else "are" end} #{doors} door#{if doors > 1 then "s" end}"
data = open("data.dt", "w+")
(1..doors).each do |door_num|
avalible_rooms = rooms.sample
puts "door #{door_num} holds #{avalible_rooms}"
data.write "#{avalible_rooms} \n"
end
data.seek(0)
print "which door do you enter? > " 
enter = $stdin.gets.chomp.to_i
entered = data.readlines[enter - 1]
if entered.include? "start_room"
start_room
elsif entered.include? "nowwwww"
puts "e"
elsif entered.include? "quit"
stuf = open("inv.sys","w")
stuf.truncate(0)
stuf.write "hands , "
stuf.close
end
end

def create_loot
table = ["loot","nope","nope","nope","nope","nope"]
loot_prob = table.sample
stuf = open("inv.sys","a+")
if loot_prob.include? "loot"
stuff = ["mace","axe","flail","dome buster","tactical pickaxe","toilet lid","katana","flintlock"]
gained = stuff.sample
#puts gained
inv = [inv]
inv.push(gained) 
stuf.write inv[-1]
stuf.write " , "
stuf.seek(0)
puts stuf.read
else
puts "you where unable to find anything of value"
end
puts "your inventory contains #{stuf.read}"
stuf.close
end

def enemies
weapon_multi = 0
kills = 0 + kills.to_i
enemies =  rand(0..10)
puts "there #{if enemies == 1 then "is" else "are" end} #{enemies} #{if enemies == 1 then "enemy" else "enemies" end}"
if enemies > 0
health = rand(10..20) * enemies
puts "the #{if enemies== 1 then "enemy has #{health}" else "enemies have a combined total of #{health}"end} hp."
print "do you want to run or fight? > "
choice = $stdin.gets.chomp
if choice.include? "run"
puts "you ran away successfully"
return
elsif choice.include? "fight"
stuf=open("inv.sys","a+")
puts "what do you use? #{stuf.read}"
tool = $stdin.gets.chomp
my_hp = 20 + kills
while health > 0
if tool.include? "hand" then weapon_multi = 1 elsif tool.include? "mace" then weapon_multi = 2.4 elsif tool.include? "axe" then weapon_multi = 3.7 elsif tool.include? "flail" then weapon_multi = 3.3 elsif tool.include? "dome buster" then weapon_multi = 4.0 elsif tool.include? "tactical pickaxe" then weapon_multi = 3.9 elsif tool.include? "toilet lid" then weapon_multi = 5 elsif tool.include? "katana" then weapon_multi = 4.2 elsif tool.include? "flintlock" then weapon_multi = 3.1 else puts "something broke" ; exit(0) end
puts "e"
atk_min = (1.0 +(kills/2)) * weapon_multi
atk_max = (3.0 +(kills/2))* weapon_multi
atk = rand(atk_min..atk_max)
health -= atk 
puts health
puts atk
my_hp -= 10
puts my_hp 
if my_hp == 0 then puts "you died" ; exit(0) end
end
kills += enemies 
return
end
end
end

module Rooms

def Rooms.start_room
stuf=open("inv.sys","a+")
puts "You walk into the first door"
create_loot
enemies
generate
end


end

