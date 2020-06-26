def sluggish_octopus(arr)

  arr.each_with_index do |ele1, i|
    the_big_one = true
    arr.each_with_index do |ele2, j|
      if i != j
        the_big_one = false if ele2.length > ele1.length
      end
    end
    return ele1 if the_big_one
  end
end

class Array
  def merge_sort(&prc)
    prc = Proc.new { |x, y| x <=> y } if prc == nil

    return self if self.length < 2

    midpoint = count / 2
    sorted_left = self[0...midpoint].merge_sort(&prc)
    sorted_right = self[midpoint..-1].merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        merged << left.shift
      when 0
        merged << left.shift
        merged << right.shift
      when 1
        merged << right.shift
      end
    end
    merged += left + right
  end
end

def dominant_octopus(arr)
  prc = Proc.new { |x, y| x.length <=> y.length }
  arr.merge_sort(&prc)[-1]
end

def clever_octopus(arr)
  the_big_one = arr[0]
  arr.each do |ele|
    the_big_one = ele if ele.length > the_big_one.length
  end
  the_big_one
end

def slow_dance(direction, arr)
  arr.each_with_index do |ele, i|
    return i if ele == direction
  end
end

def fast_dance(direction, arr)
  arr.index(direction)
end

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p sluggish_octopus(arr)
# p dominant_octopus(arr)
# p clever_octopus(arr)

# direction = "down"
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# p slow_dance(direction, tiles_array)
# p fast_dance(direction, tiles_array)