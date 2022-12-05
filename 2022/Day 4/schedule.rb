elven_schedules = File.readlines("2022/Day 4/schedule.txt", chomp: true)

elven_rangers = elven_schedules.map do |schedule|
  schedule.split(",").map do |elf|
    elf.split('-').map(&:to_i).reduce(&Range.method(:new))
  end
end

#Part 1
elven_rangers.count { |(elf_one, elf_two)| elf_one.cover?(elf_two) || elf_two.cover?(elf_one) }

#Part 2
p elven_rangers.count { |elf_one, elf_two| elf_one.cover?(elf_two.first) || elf_two.cover?(elf_one.first)}
