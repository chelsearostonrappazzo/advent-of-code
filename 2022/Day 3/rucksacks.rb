# rucksacks = ["vJrwpWtwJgWrhcsFMMfFFhFp", 
# "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
# "PmmdzqPrVvPwwTWBwg",
# "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
# "ttgJtRGJQctTZtZT",
# "CrZsJsPPZsGzwwsLwLmpwMDw"]
rucksacks = File.readlines("rucksack.txt", chomp: true)
little_points = ("a".."z").zip((1..26)).to_h
points = little_points.merge(("A".."Z").zip((27..52)).to_h)

totals = rucksacks.map do |rucksack| 
  # split_rucksack = rucksack.scan(/(.{#{(rucksack.size)/2}})/).flatten
  split_rucksack = rucksack.split("").each_slice(rucksack.size/2).to_a
twinning = split_rucksack[0] & split_rucksack[1]
points[twinning.join("")]
end 

totals.sum

new_edition = rucksacks.each_slice(3).to_a
updated_totals = new_edition.map do |new|
  commoner = new[0].chars & new[1].chars & new[2].chars
  points[commoner.join("")]
end

p updated_totals.sum