# A script to generate seeds file information to add_data to a database

class SeedFileGenerator

  def initialize
    #strings to print into the seeds file
    @strings = []
  end

  #write the results to a file to be run with "rails db:seed"
  def write_to_file
    f = File.new('db/seeds.rb', 'w')
    @strings.each do |x|
      f.write("#{x}\n")
    end
    f.close
  end

  def add_data name, data, keys
    # add first line
    @strings << "#{name}.destroy_all"
    @strings << ""
    #loop through all keys and print
    data.each_with_index do |entry, i|
      str = "#{get_trunc_name(name)}#{i} = #{name}.create "
      keys.each_with_index do |key, j|
        str += "#{key}: \"#{data[i][j]}\", "
      end
      #puts str.chomp(", ")
      @strings << str.chomp(", ")
    end
    # add last line
    @strings << ""
    @strings << "puts \"Created \#{#{name}.all.length} #{name.downcase}s.\""
    @strings << ""
  end

  def add_associations keys, map
    map[keys[0]].each do |k|
      assoc_str = "#{get_trunc_name(keys[0])}#{k}.#{keys[1].downcase}s"
      map[keys[1]][k].each do |x|
        assoc_str += " << #{get_trunc_name(keys[1])}#{x}"
      end
      @strings << assoc_str
    end
    @strings << ""
  end

  #get truncated name for unique variable name creation
  def get_trunc_name name
    name[0..3].downcase
  end

  #Add a line of comment to the output
  def add_comment_line line
    @strings << line
  end

end

#initializing generator
generator = SeedFileGenerator.new

generator.add_comment_line "# Adding the data"
#adding data

keys = ['flight_number', 'date', 'destination', 'origin']
map = [["BURN01", "03-11-2018", "Melbourne", "Sydney"],
       ["BURN01", "04-11-2018", "Melbourne", "Sydney"],
       ["BURN01", "05-11-2018", "Melbourne", "Sydney"],
       ["BURN02", "03-11-2018", "Sydney", "Melbourne"],
       ["BURN02", "04-11-2018", "Sydney", "Melbourne"],
       ["BURN02", "05-11-2018", "Sydney", "Melbourne"],
       ["BURN03", "03-11-2018", "Sydney", "Brisbane"],
       ["BURN04", "04-11-2018", "Sydney", "Adelaide"],
       ["BURN05", "05-11-2018", "Sydney", "Perth"],
       ["BURN06", "03-11-2018", "Melbourne", "Brisbane"],
       ["BURN07", "04-11-2018", "Melbourne", "Adelaide"],
       ["BURN08", "05-11-2018", "Melbourne", "Perth"],
       ["BURN09", "03-11-2018", "Brisbane", "Perth"],
       ["BURN10", "04-11-2018", "Brisbane", "Adelaide"],
       ["BURN10", "05-11-2018", "Brisbane", "Adelaide"],
       ["BURN10", "06-11-2018", "Brisbane", "Adelaide"],
       ["BURN10", "07-11-2018", "Brisbane", "Adelaide"],
       ["BURN11", "05-11-2018", "Perth", "Brisbane"],
       ["BURN11", "06-11-2018", "Perth", "Brisbane"],
       ["BURN11", "07-11-2018", "Perth", "Brisbane"]
      ]
generator.add_data "Flight", map, keys

keys = ['rows', 'columns', 'model']
map = [[24, 4, "737"],
       [34, 6, "747"],
       [44, 8, "A380"]
      ]
generator.add_data "Airplane", map, keys

keys = ['seatRow', 'seatColumn']
map = [["2", "1"],
       ["3", "1"],
       ["4", "3"],
       ["5", "4"],
       ["6", "1"],
       ["7", "1"],
       ["8", "2"],
       ["9", "4"],
       ["10", "1"],
       ["11", "2"],
       ["12", "3"],
       ["13", "1"],
       ["14", "4"],
       ["15", "3"],
       ["16", "1"],
       ["17", "3"],
       ["18", "1"],
       ["19", "1"],
       ["20", "2"],
       ["21", "3"],
       ["1", "1"],
       ["1", "2"],
       ["1", "3"],
       ["1", "4"],
       ["2", "1"],
       ["2", "2"],
       ["2", "3"],
       ["2", "4"],
       ["3", "1"],
       ["3", "2"],
       ["3", "3"],
       ["3", "4"],
       ["4", "1"],
       ["4", "2"],
       ["4", "3"],
       ["4", "4"],
       ["5", "1"],
       ["5", "2"],
       ["5", "3"],
       ["5", "4"],
       ["6", "1"],
       ["6", "2"],
       ["6", "3"],
       ["6", "4"],
       ["7", "1"],
       ["7", "2"],
       ["7", "3"],
       ["7", "4"],
       ["8", "1"],
       ["8", "2"],
       ["8", "3"],
       ["8", "4"],
       ["9", "1"],
       ["9", "2"],
       ["9", "3"],
       ["9", "4"],
       ["10", "1"],
       ["10", "2"],
       ["10", "3"],
       ["10", "4"],
       ["11", "1"],
       ["11", "2"],
       ["11", "3"],
       ["11", "4"],
       ["12", "1"],
       ["12", "2"],
       ["12", "3"],
       ["12", "4"],
       ["13", "1"],
       ["13", "2"],
       ["13", "3"],
       ["13", "4"],
       ["14", "1"],
       ["14", "2"],
       ["14", "3"],
       ["14", "4"],
       ["15", "1"],
       ["15", "2"],
       ["15", "3"],
       ["15", "4"],
       ["16", "1"],
       ["16", "2"],
       ["16", "3"],
       ["16", "4"],
       ["17", "1"],
       ["17", "2"],
       ["17", "3"],
       ["17", "4"],
       ["18", "1"],
       ["18", "2"],
       ["18", "3"],
       ["18", "4"],
       ["19", "1"],
       ["19", "2"],
       ["19", "3"],
       ["19", "4"],
       ["20", "1"],
       ["20", "2"],
       ["20", "3"],
       ["20", "4"],
       ["21", "1"],
       ["21", "2"],
       ["21", "3"],
       ["21", "4"],
       ["22", "1"],
       ["22", "2"],
       ["22", "3"],
       ["22", "4"],
       ["23", "1"],
       ["23", "2"],
       ["23", "3"],
       ["23", "4"],
       ["24", "1"],
       ["24", "2"],
       ["24", "3"]
      ]
generator.add_data "Reservation", map, keys

keys = ['name', 'email', 'password']
map = [["Luke Lemon", "luke.lemon@gmail.com", "chicken"],
       ["Bob Pilot", "bobby_boy@hotmail.com", "chicken"],
       ["John Bananas", "john@bananarama.com", "chicken"]
      ]
generator.add_data "User", map, keys

#Adding associations
generator.add_comment_line "# Adding the associations"
keys = ['User', 'Reservation']
map = {
  keys[0] => [0, 1, 2],
  keys[1] => [[20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114], [2, 3], [4, 5, 6, 7, 15, 16, 8, 9, 10, 11]]
}
generator.add_associations keys, map

keys = ['Flight', 'Reservation']
map = {
  keys[0] => [0, 1, 2, 3, 4, 5, 6, 7, 8],
  keys[1] => [[], [12, 13, 14], [20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114], [17, 18, 19], [], [0, 1, 2, 3, 4, 5, 6, 7, 15, 16, 8, 9, 10, 11], [], [], []]
}
generator.add_associations keys, map

keys = ['Airplane', 'Flight']
map = {
  keys[0] => [0, 1, 2],
  keys[1] => [[0, 1, 2, 3, 4, 5, 6, 7, 15, 16, 17, 18, 19], [8, 9, 10, 11], [12, 13, 14]]
}
generator.add_associations keys, map

generator.write_to_file
