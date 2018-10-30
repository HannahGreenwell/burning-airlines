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
    #loop through all keys and print e.g.
    #u1 = User.create name: 'Luke', email: 'luke@ga.co', password: 'chicken'
    (0...data[keys[0]].length).each do |x|
      str = "#{get_trunc_name(name)}#{x} = #{name}.create "
       data.each do |k,v|
         str += "#{k}: \"#{v[x]}\", "
       end
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
map = {
  keys[0] => [
    "QF01",
    "BA666",
    "CX098",
    "SG77",
    "QF7"
  ],
  keys[1] => [
    "03-11-2018",
    "04-12-2018",
    "08-12-2018",
    "09-03-2019",
    "22-11-2018"
  ],
  keys[2] => [
    "Melbourne",
    "London",
    "Hong Kong",
    "Singapore",
    "Cairns"
  ],
  keys[3] => [
    "Sydney",
    "Dubai",
    "Taiwan",
    "Delhi",
    "Brisbane"
  ]
}
generator.add_data "Flight", map, keys

keys = ['rows', 'columns', 'model']
map = {
  keys[0] => [
    24,
    34,
    44
  ],
  keys[1] => [
    4,
    6,
    8
  ],
  keys[2] => [
    "737",
    "747",
    "A380"
  ]
}
generator.add_data "Airplane", map, keys

keys = ['seatRow', 'seatColumn']
map = {
  keys[0] => [
    "2",
    "3",
    "4",
    "5",
    "6",
    "7"
  ],
  keys[1] => [
    "A",
    "A",
    "B",
    "D",
    "C",
    "C"
  ]
}
generator.add_data "Reservation", map, keys

keys = ['name', 'email', 'password']
map = {
  keys[0] => [
    "Luke Lemon",
    "Bob Pilot",
    "John Bananas"
  ],
  keys[1] => [
    "luke.lemon@gmail.com",
    "bobby_boy@hotmail.com",
    "john@bananarama.com"
  ],
  keys[2] => [
    "chicken",
    "chicken",
    "chicken"
  ]
}
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
  keys[1] => [[0], [1, 2], [3], [4, 5]]
}
generator.add_associations keys, map

keys = ['Airplane', 'Flight']
map = {
  keys[0] => [0, 1, 2],
  keys[1] => [[0, 2], [1], [3, 4]]
}
generator.add_associations keys, map

generator.write_to_file
