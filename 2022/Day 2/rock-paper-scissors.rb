input = [["A", "Y"], ["B", "X"], ["C", "Z"]]
rounds = File.readlines("2022/Day 2/rps_scores.txt", chomp: true)
# X rock Y paper Z scissors
points = { X: 1, Y: 2, Z: 3, w: 6, d: 3, l: 0}
match_points = {
  "A Y" => points[:w] + points[:Y],
  "A X" => points[:d] + points[:X],
  "A Z" => points[:l] + points[:Z],
  "B Y" => points[:d] + points[:Y],
  "B X" => points[:l] + points[:X],
  "B Z" => points[:w] + points[:Z],
  "C Y" => points[:l] + points[:Y],
  "C X" => points[:w] + points[:X],
  "C Z" => points[:d] + points[:Z],
}
# X - lose
# Y - draw
# Z - win
real_match_points = { 
  "A Y" => points[:d] + points[:X],
  "A X" => points[:l] + points[:Z],
  "A Z" => points[:w] + points[:Y],
  "B Y" => points[:d] + points[:Y],
  "B X" => points[:l] + points[:X],
  "B Z" => points[:w] + points[:Z],
  "C Y" => points[:d] + points[:Z],
  "C X" => points[:l] + points[:Y],
  "C Z" => points[:w] + points[:X],
}

puts results = rounds.map(&match_points).sum
puts real_results = rounds.map(&real_match_points).sum