=begin
Part 1
The newly-improved calibration document consists of lines of text; each line
originally contained a specific calibration value that the Elves now need to
recover. On each line, the calibration value can be found by combining the
first digit and the last digit (in that order) to form a single two-digit
number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
In this example, the calibration values of these four lines are 12, 38, 15,and
77. Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the
calibration values?

trebuchet = File.open("trebuchet.txt").read
trebuchet = trebuchet.split
trebuchet.map! do |ele|
  num = ele.gsub(/[a-z]/, '')
  (num[0] + num[-1]).to_i
end
p trebuchet.sum

Part 2
Your calculation isn't quite right. It looks like some of the digits are
actually spelled out with letters: one, two, three, four, five, six, seven,
eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and
last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76.
Adding these together produces 281.

What is the sum of all of the calibration values?
=end
SUBS = {'one' => '1',
        'two' => '2',
        'three' => '3',
        'four' => '4',
        'five' => '5',
        'six' => '6',
        'seven' => '7',
        'eight' => '8',
        'nine' => '9',
        '1' => '1',
        '2' => '2',
        '3' => '3',
        '4' => '4',
        '5' => '5',
        '6' => '6',
        '7' => '7',
        '8' => '8',
        '9' => '9'} 

example = %w(two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2
             zoneight234 7pqrstsixteen)

def convert_to_digits(str)
  nums = []
  (0..str.size).each do |idx|
    SUBS.each do |key,value|
      nums << value if str[idx, key.size] == key
    end
  end
  nums.join
end

def remove_letters(str)
  convert_to_digits(str).gsub(/[a-z]/, '')
end

def combine_first_and_last_digits(str)
  remove_letters(str)[0] + remove_letters(str)[-1]
end

def coordinates(str)
  combine_first_and_last_digits(str).to_i
end

example.map! do |ele|
  coordinates(ele)
end

p example.sum

trebuchet = File.open("trebuchet.txt").read.split
trebuchet.map! do |ele|
 coordinates(ele)
end

p trebuchet.sum
