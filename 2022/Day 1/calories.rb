file = File.read("2022/Day 1/elf_calories.txt").split("\n\n")

elven_calories = file.map { |elf| elf.split("\n").map(&:to_i).sum }

puts elven_calories.max

puts elven_calories.max(3).sum