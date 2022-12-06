simplified_crates = {"1" => ["N", "Z"], "2" => ["D", "C", "M"], "3" => ["P"]}

crate_instructions = [
  "move 1 from 2 to 1",
  "move 3 from 1 to 3",
  "move 2 from 2 to 1",
  "move 1 from 1 to 2"
]

# crates = File.read("2022/Day 5/crates.txt").split("\n\n")

# simplified_crates = crates[0]
#   .split("\n")
#   .map(&:chars)
#   .transpose
#   .select! { |stack| stack.any? { |e| e.match?(/\d+/) } }
#   .to_h { |stack| [stack.pop, stack.reject { |e| e == " " }] }

# crate_instructions = crates[1].lines

crate_instructions.map do |crate|
  amount = crate.scan(/\d+/) [0].to_i
  origin = crate.scan(/\d+/) [1]
  destination = crate.scan(/\d+/).last

  #part 1
  # amount.times { simplified_crates[destination].unshift simplified_crates[origin].shift }

  #part 2
  simplified_crates[destination].unshift(*simplified_crates[origin].shift(amount))
end

p simplified_crates.values.map(&:first).join

