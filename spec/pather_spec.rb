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
    it "returns to an array all the positions of all hash characters" do


    end
  end

end

describe Move do
  describe "move_down" do
    pending

  end

  describe "move_left" do
    pending
  end

  describe "move_right" do
    pending
  end
end
