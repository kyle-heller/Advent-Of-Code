require 'pry-byebug'
file = File.open("input.txt")
input = file.read

nocomma = Array.new()
nodash = Array.new()
ranges = Array.new()

lines = input.split("\n")
lines.each {|value| nocomma.push(value.split(","))}
nocomma.each_with_index do
  |v, i|
  nocomma[i].each {|value| nodash.push(value.split("-"))}
end

nodash.each do
  |value| 
  ranges.push((value[0].to_i)..(value[1].to_i))
end

def check_ranges(ranges)
  a = 0
  b = 1
  count = 0
  check1 = ((ranges[a].first >= ranges[b].first) && (ranges[a].last <= ranges[b].last))
  check2 = ((ranges[b].first >= ranges[a].first) && (ranges[b].last <= ranges[a].last))
  (ranges.size / 2).times do
    if ((ranges[a].first >= ranges[b].first) && (ranges[a].last <= ranges[b].last)) == true || 
      ((ranges[b].first >= ranges[a].first) && (ranges[b].last <= ranges[a].last)) == true
      # binding.pry
      count += 1
      puts count
    end
  a += 2
  b += 2
  end
end


def check_ranges_intersect(ranges)
  a = 0
  b = 1
  count = 0
  (ranges.size / 2).times do
    if ((ranges[a].first <= ranges[b].last) and (ranges[b].first <= ranges[a].last)) == true      # binding.pry
      count += 1
      puts count
    end
  a += 2
  b += 2
  end
end

check_ranges_intersect(ranges)