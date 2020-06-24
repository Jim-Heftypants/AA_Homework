class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..1).each do |k|
      (0..5).each do |i|
        p = i + (7 * k)
        @cups[p] = Array.new(4, :stone)
      end
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    if !(0..13).include?(start_pos)
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    current_pos = start_pos.dup
    while stones > 0
      current_pos += 1
      current_pos = current_pos % 14
      if current_player_name == @player1 && current_pos == 13
      elsif current_player_name == @player2 && current_pos == 6
      else
        @cups[current_pos] << :stone
        stones -= 1
      end
    end
    @cups[start_pos] = []
    render
    return next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty? 
    (0..1).each do |k|
      one_side_empty = true
      (0..5).each do |i|
        p = i + (7 * k)
        one_side_empty = false if @cups[p].length > 0
      end
      return true if one_side_empty == true
    end
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @player1
    else
      return @player2
    end
  end
end
