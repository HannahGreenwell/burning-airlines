# Adding the data
Flight.destroy_all

flig0 = Flight.create flight_number: "QF01", date: "03-11-2018", destination: "Melbourne", origin: "Sydney"
flig1 = Flight.create flight_number: "QF03", date: "04-12-2018", destination: "Melbourne", origin: "Sydney"
flig2 = Flight.create flight_number: "QF05", date: "08-12-2018", destination: "Brisbane", origin: "Sydney"
flig3 = Flight.create flight_number: "QF09", date: "04-11-2018", destination: "Sydney", origin: "Melbourne"
flig4 = Flight.create flight_number: "BA666", date: "05-12-2018", destination: "London", origin: "Dubai"
flig5 = Flight.create flight_number: "CX098", date: "08-12-2018", destination: "Hong Kong", origin: "Taipei"
flig6 = Flight.create flight_number: "SG77", date: "09-03-2019", destination: "Singapore", origin: "Delhi"
flig7 = Flight.create flight_number: "QF7", date: "22-11-2018", destination: "Cairns", origin: "Brisbane"

puts "Created #{Flight.all.length} flights."

Airplane.destroy_all

airp0 = Airplane.create rows: "24", columns: "4", model: "737"
airp1 = Airplane.create rows: "34", columns: "6", model: "747"
airp2 = Airplane.create rows: "44", columns: "8", model: "A380"

puts "Created #{Airplane.all.length} airplanes."

Reservation.destroy_all

rese0 = Reservation.create seatRow: "2", seatColumn: "1"
rese1 = Reservation.create seatRow: "3", seatColumn: "1"
rese2 = Reservation.create seatRow: "4", seatColumn: "2"
rese3 = Reservation.create seatRow: "5", seatColumn: "4"
rese4 = Reservation.create seatRow: "6", seatColumn: "3"
rese5 = Reservation.create seatRow: "7", seatColumn: "3"

puts "Created #{Reservation.all.length} reservations."

User.destroy_all

user0 = User.create name: "Luke Lemon", email: "luke.lemon@gmail.com", password: "chicken"
user1 = User.create name: "Bob Pilot", email: "bobby_boy@hotmail.com", password: "chicken"
user2 = User.create name: "John Bananas", email: "john@bananarama.com", password: "chicken"

puts "Created #{User.all.length} users."

# Adding the associations
user0.reservations << rese0 << rese1
user1.reservations << rese2 << rese3
user2.reservations << rese4 << rese5

flig0.reservations << rese0
flig1.reservations << rese1 << rese2
flig2.reservations << rese3
flig3.reservations << rese4 << rese5

airp0.flights << flig0 << flig2 << flig7
airp1.flights << flig1 << flig6
airp2.flights << flig3 << flig4 << flig5

