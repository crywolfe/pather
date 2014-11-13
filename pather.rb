
Pather = Struct.new(:data) do
  data = []

end

# Set input grid
@data = []

# Get file and return it as an array
def get_file(filename)
  file = File.open(filename, "r")
  file.each_line do |line|
    line = line.delete "\n"
    @data.push(line)
  end
  file.close
  return @data
end

# Determine size of grid

def get_size(data)
  @horizontal_length = data[0].length
  @vertical_length = data.length
end

# Find Hash locations

def get_hash_position
  hash_position = []
  for i in 0...@vertical_length
    for j in 0...@horizontal_length
      if @data[i][j] == "#"
        hash_position.push([i,j])
      end
    end
  end

# Abstract out to allow for more than 2 hashes in the grid
  hash_num = hash_position.length
  for k in 0...hash_num-1
    # Move down
    while hash_position[k][0] < hash_position[k+1][0]
      hash_position[k][0] += 1
      @data[hash_position[k][0]][hash_position[k][1]] = "*"
    end

    # Move to the right
    while hash_position[k][0] == hash_position[k+1][0] && hash_position[k][1] < hash_position[k+1][1] - 1
      hash_position[k][1] += 1
      @data[hash_position[k][0]][hash_position[k][1]] = "*"
    end

    # Move to the left
    while hash_position[k][0] == hash_position[k+1][0] && hash_position[k][1] > hash_position[k+1][1] + 1
      hash_position[k][1] -= 1
      @data[hash_position[k][0]][hash_position[k][1]] = "*"
    end
  end
end



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


get_file("input.txt")
get_size(@data)
get_hash_position
write_file("output.txt")
