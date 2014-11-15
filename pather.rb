#!/usr/bin/env ruby
require 'pry'

# Set input grid
class Grid

  attr_accessor :data

  def initialize
    @data = []
  end

  # Get file and return it as an array
  def get_file(filename)
    file = File.open(filename, "r")
    file.each_line do |line|
      line = line.delete "\n"
      @data.push(line)
    end
    file.close
    @data
  end #get_file

  # Determine size of grid
  def get_size(data)
    @horizontal_length = data[0].length
    @vertical_length = data.length
  end
  # Find Hash locations
  def get_hash_pos
    @hash_pos = []
    for i in 0...@vertical_length
      for j in 0...@horizontal_length
        if @data[i][j] == "#"
          @hash_pos << [i,j]
        end
      end # j
    end # i
    @hash_pos
  end #get_hash_pos

  # Convert data array to string
  def convert_to_string
    @data.join("\n")
  end

  # Write output to output.txt file
  def write_file(filename)
    data = convert_to_string
    file = File.open(filename, "w")
    file.write(data)
    file.close
  end
end #Grid

class Move
  attr_reader :grid

  def initialize(grid)
    @grid = grid
    @hash_pos = grid.get_hash_pos
    @data = grid.data
  end
# Move down
  def move_down(k)
    while @hash_pos[k][0] < @hash_pos[k+1][0]
      @hash_pos[k][0] += 1
      @data[@hash_pos[k][0]][@hash_pos[k][1]] = "*"
    end
  end

  # Move right
  def move_right(k)
    while @hash_pos[k][0] == @hash_pos[k+1][0] && @hash_pos[k][1] < @hash_pos[k+1][1] - 1
      @hash_pos[k][1] += 1
      @data[@hash_pos[k][0]][@hash_pos[k][1]] = "*"
    end
  end

  # Move left
  def move_left(k)
    while @hash_pos[k][0] == @hash_pos[k+1][0] && @hash_pos[k][1] > @hash_pos[k+1][1] + 1
      @hash_pos[k][1] -= 1
      @data[@hash_pos[k][0]][@hash_pos[k][1]] = "*"
    end
  end

# Run the move logic across the grid
  def run
    hash_num = grid.get_hash_pos.length
    for k in 0...hash_num-1
      move_down(k)
      move_right(k)
      move_left(k)
    end
  end
end


# MAIN
def main
  g = Grid.new
  # In order to have tests work with rspec, need to have a default value assigned to argv.
  g.get_file(ARGV[0]="input.txt")
  g.get_size(g.data)
  g.get_hash_pos

  m = Move.new(g)
  m.run

# In order to have tests work with rspec, need to have a default value assigned to argv.
  g.write_file(ARGV[1]="output.txt")
end

main
