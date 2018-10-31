# Adding the data
Flight.destroy_all

flig0 = Flight.create flight_number: "BURN01", date: "03-11-2018", destination: "Melbourne", origin: "Sydney"
flig1 = Flight.create flight_number: "BURN01", date: "04-11-2018", destination: "Melbourne", origin: "Sydney"
flig2 = Flight.create flight_number: "BURN01", date: "05-11-2018", destination: "Melbourne", origin: "Sydney"
flig3 = Flight.create flight_number: "BURN02", date: "03-11-2018", destination: "Sydney", origin: "Melbourne"
flig4 = Flight.create flight_number: "BURN02", date: "04-11-2018", destination: "Sydney", origin: "Melbourne"
flig5 = Flight.create flight_number: "BURN02", date: "05-11-2018", destination: "Sydney", origin: "Melbourne"
flig6 = Flight.create flight_number: "BURN03", date: "03-11-2018", destination: "Sydney", origin: "Brisbane"
flig7 = Flight.create flight_number: "BURN04", date: "04-11-2018", destination: "Sydney", origin: "Adelaide"
flig8 = Flight.create flight_number: "BURN05", date: "05-11-2018", destination: "Sydney", origin: "Perth"
flig9 = Flight.create flight_number: "BURN06", date: "03-11-2018", destination: "Melbourne", origin: "Brisbane"
flig10 = Flight.create flight_number: "BURN07", date: "04-11-2018", destination: "Melbourne", origin: "Adelaide"
flig11 = Flight.create flight_number: "BURN08", date: "05-11-2018", destination: "Melbourne", origin: "Perth"
flig12 = Flight.create flight_number: "BURN09", date: "03-11-2018", destination: "Brisbane", origin: "Perth"
flig13 = Flight.create flight_number: "BURN10", date: "04-11-2018", destination: "Brisbane", origin: "Adelaide"
flig14 = Flight.create flight_number: "BURN10", date: "05-11-2018", destination: "Brisbane", origin: "Adelaide"
flig15 = Flight.create flight_number: "BURN10", date: "06-11-2018", destination: "Brisbane", origin: "Adelaide"
flig16 = Flight.create flight_number: "BURN10", date: "07-11-2018", destination: "Brisbane", origin: "Adelaide"
flig17 = Flight.create flight_number: "BURN11", date: "05-11-2018", destination: "Perth", origin: "Brisbane"
flig18 = Flight.create flight_number: "BURN11", date: "06-11-2018", destination: "Perth", origin: "Brisbane"
flig19 = Flight.create flight_number: "BURN11", date: "07-11-2018", destination: "Perth", origin: "Brisbane"

puts "Created #{Flight.all.length} flights."

Airplane.destroy_all

airp0 = Airplane.create rows: "24", columns: "4", model: "737"
airp1 = Airplane.create rows: "34", columns: "6", model: "747"
airp2 = Airplane.create rows: "44", columns: "8", model: "A380"

puts "Created #{Airplane.all.length} airplanes."

Reservation.destroy_all

rese0 = Reservation.create seatRow: "2", seatColumn: "1"
rese1 = Reservation.create seatRow: "3", seatColumn: "1"
rese2 = Reservation.create seatRow: "4", seatColumn: "3"
rese3 = Reservation.create seatRow: "5", seatColumn: "4"
rese4 = Reservation.create seatRow: "6", seatColumn: "1"
rese5 = Reservation.create seatRow: "7", seatColumn: "1"
rese6 = Reservation.create seatRow: "8", seatColumn: "2"
rese7 = Reservation.create seatRow: "9", seatColumn: "4"
rese8 = Reservation.create seatRow: "10", seatColumn: "1"
rese9 = Reservation.create seatRow: "11", seatColumn: "2"
rese10 = Reservation.create seatRow: "12", seatColumn: "3"
rese11 = Reservation.create seatRow: "13", seatColumn: "1"
rese12 = Reservation.create seatRow: "14", seatColumn: "4"
rese13 = Reservation.create seatRow: "15", seatColumn: "3"
rese14 = Reservation.create seatRow: "16", seatColumn: "1"
rese15 = Reservation.create seatRow: "17", seatColumn: "3"
rese16 = Reservation.create seatRow: "18", seatColumn: "1"
rese17 = Reservation.create seatRow: "19", seatColumn: "1"
rese18 = Reservation.create seatRow: "20", seatColumn: "2"
rese19 = Reservation.create seatRow: "21", seatColumn: "3"

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

flig0.reservations << rese0 << rese1 << rese2 << rese3 << rese4 << rese5 << rese6 << rese7 << rese15 << rese16
flig1.reservations << rese8 << rese9 << rese10 << rese11
flig2.reservations << rese12 << rese13 << rese14
flig3.reservations << rese17 << rese18 << rese19

airp0.flights << flig0 << flig1 << flig2 << flig3 << flig4 << flig5 << flig6 << flig7 << flig15 << flig16 << flig17 << flig18 << flig19
airp1.flights << flig8 << flig9 << flig10 << flig11
airp2.flights << flig12 << flig13 << flig14

