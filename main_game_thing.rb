require_relative "./map.rb"

puts "what your name"
print "> "

ee = $stdin.gets.chomp

puts "hello #{ee}, lets begin your journey into the dungeons."

puts "there is a door in front of you. Will you go in?"

print "> "
choice = $stdin.gets.chomp



if choice == "e"
Rooms.start_room
elsif choice == "no"
puts "you walk away and forget all about it"
exit(0)
end
