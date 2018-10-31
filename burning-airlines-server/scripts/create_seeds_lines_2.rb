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
       ["21", "3"]
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
  keys[1] => [[0, 1], [2, 3], [4, 5]]
}
generator.add_associations keys, map

keys = ['Flight', 'Reservation']
map = {
  keys[0] => [0, 1, 2, 3],
  keys[1] => [[0, 1, 2, 3, 4, 5, 6, 7, 15, 16], [8, 9, 10, 11], [12, 13, 14], [17, 18, 19]]
}
generator.add_associations keys, map

keys = ['Airplane', 'Flight']
map = {
  keys[0] => [0, 1, 2],
  keys[1] => [[0, 1, 2, 3, 4, 5, 6, 7, 15, 16, 17, 18, 19], [8, 9, 10, 11], [12, 13, 14]]
}
generator.add_associations keys, map

generator.write_to_file
