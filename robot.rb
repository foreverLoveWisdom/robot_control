# frozen_string_literal: true

# Robot Interface
class Robot
  attr_reader :direction, :location

  DIRECTIONS = { north: 'north', east: 'east', south: 'south', west: 'west' }.freeze

  LEFT_TURNS = {
    north: DIRECTIONS[:west],
    west: DIRECTIONS[:south],
    south: DIRECTIONS[:east],
    east: DIRECTIONS[:north]
  }.freeze

  RIGHT_TURNS = {
    north: DIRECTIONS[:east],
    east: DIRECTIONS[:south],
    south: DIRECTIONS[:west],
    west: DIRECTIONS[:north]
  }.freeze

  def initialize
    @direction = 'north'
    @location = [0, 0]
  end

  def left
    @direction = LEFT_TURNS[direction.to_sym]
  end

  def right
    @direction = RIGHT_TURNS[direction.to_sym]
  end

  def move
    case @direction
    when 'north'
      @location[1] += 1
    when 'east'
      @location[0] += 1
    when 'south'
      @location[1] -= 1
    when 'west'
      @location[0] -= 1
    end
  end

  def shutdown
    exit
  end
end

# class Robot
#   attr_reader :direction, :location

#   DIRECTIONS = { north: [0, 1], east: [1, 0], south: [0, -1], west: [-1, 0] }.freeze

#   LEFT_TURNS = {
#     north: :west,
#     west: :south,
#     south: :east,
#     east: :north
#   }.freeze

#   RIGHT_TURNS = {
#     north: :east,
#     east: :south,
#     south: :west,
#     west: :north
#   }.freeze

#   def initialize
#     @direction = :north
#     @location = [0, 0]
#     raise ArgumentError, 'Invalid direction' unless DIRECTIONS.key?(@direction)
#   end

#   def left
#     @direction = LEFT_TURNS[@direction]
#   end

#   def right
#     @direction = RIGHT_TURNS[@direction]
#   end

#   def move
#     move_x, move_y = DIRECTIONS[@direction]
#     @location[0] += move_x
#     @location[1] += move_y
#   end

#   def shutdown
#     exit
#   end
# end
