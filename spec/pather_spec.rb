# require 'spec_helper'
require_relative '../pather'


describe Grid do
  grid = Grid.new

  describe "get_file" do
    it "returns an array from an input.txt file" do
      grid.get_file('input.txt')
      input_as_array = ["........................",
                        "........................",
                        "....#...................",
                        "........................",
                        "........................",
                        "........................",
                        "........................",
                        "..................#.....",
                        "........................",
                        "........................",
                        "........................",
                        "........................"]
      expect(grid.data).to eq(input_as_array)
    end
  end

  describe "get_hash_pos" do
    it "returns an array of the positions of all hash characters" do
      # array of 7 X 14
      data =           ["..............",
                        "....#.........",
                        ".........#....",
                        "..............",
                        "..............",
                        "..........#...",
                        ".............."]
      grid.get_size(data)
      expect(grid.get_hash_pos(data)).to eq([[1,4], [2,9], [5,10]])
    end
  end
end

describe Move do
  grid = Grid.new
  data =           ["..............",
                    "....#.........",
                    ".........#....",
                    "..............",
                    "..............",
                    "..........#...",
                    ".............."]
  grid.data = data
  grid.get_size(grid.data)
  grid.get_hash_pos(grid.data)

  move = Move.new(grid)

  describe "run" do
    it "returns the output file with asterisks in the right place" do
      output =         ["..............",
                        "....#.........",
                        "....*****#....",
                        ".........*....",
                        ".........*....",
                        ".........*#...",
                        ".............."]

      move.run
      expect(grid.data).to eql(output)
    end
  end

end
