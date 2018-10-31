# Adding the data
Flight.destroy_all

flig0 = Flight.create flight_number: "QF01", date: "03-11-2018", destination: "Melbourne", origin: "Sydney"
flig1 = Flight.create flight_number: "BA666", date: "04-12-2018", destination: "London", origin: "Dubai"
flig2 = Flight.create flight_number: "CX098", date: "08-12-2018", destination: "Hong Kong", origin: "Taiwan"
flig3 = Flight.create flight_number: "SG77", date: "09-03-2019", destination: "Singapore", origin: "Delhi"
flig4 = Flight.create flight_number: "QF7", date: "22-11-2018", destination: "Cairns", origin: "Brisbane"
flig5 = Flight.create flight_number: "QF05", date: "03-15-2018", destination: "Melbourne", origin: "Sydney"

puts "Created #{Flight.all.length} flights."

Airplane.destroy_all

airp0 = Airplane.create rows: "24", columns: "4", model: "737"
airp1 = Airplane.create rows: "34", columns: "6", model: "747"
airp2 = Airplane.create rows: "44", columns: "8", model: "A380"

puts "Created #{Airplane.all.length} airplanes."

Reservation.destroy_all

rese0 = Reservation.create seatRow: "2", seatColumn: "A"
rese1 = Reservation.create seatRow: "3", seatColumn: "A"
rese2 = Reservation.create seatRow: "4", seatColumn: "B"
rese3 = Reservation.create seatRow: "5", seatColumn: "D"
rese4 = Reservation.create seatRow: "6", seatColumn: "C"
rese5 = Reservation.create seatRow: "7", seatColumn: "C"
rese6 = Reservation.create seatRow: "17", seatColumn: "C"
rese7 = Reservation.create seatRow: "11", seatColumn: "D"

puts "Created #{Reservation.all.length} reservations."

User.destroy_all

user0 = User.create name: "Luke Lemon", email: "luke.lemon@gmail.com", password: "chicken"
user1 = User.create name: "Bob Pilot", email: "bobby_boy@hotmail.com", password: "chicken"
user2 = User.create name: "John Bananas", email: "john@bananarama.com", password: "chicken"

puts "Created #{User.all.length} users."

# Adding the associations
user0.reservations << rese0 << rese1
user1.reservations << rese2 << rese3
user2.reservations << rese4 << rese5 << rese6 << rese7

flig0.reservations << rese0
flig1.reservations << rese1
flig2.reservations << rese3
flig3.reservations << rese4
flig4.reservations << rese5 << rese6
flig5.reservations << rese2 << rese7

airp0.flights << flig0 << flig2
airp1.flights << flig1
airp2.flights << flig3 << flig4 << flig5
