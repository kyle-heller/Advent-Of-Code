data = "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"

data_array = data.split("\n")
elves = Hash.new {|h,k| h[k]=[]}
elves_total = Hash.new {|h,k| h[k]=[]}
elf_counter = 1

data_array.each_with_index do
  |value, index| 
  if data_array[index] != ""
    elves[elf_counter] << value.to_i
  elsif data_array[index] == ""
    elf_counter += 1
  end
end

elves.each do 
  |key, value|
  sumvalue = elves[key].sum
  elves_total["elves"] << sumvalue
end

elfmax = elves_total["elves"].each_with_index.max[1]

puts "Elf #{elfmax + 1} has the highest number of calories with #{elves_total["elves"][elfmax]} total!"