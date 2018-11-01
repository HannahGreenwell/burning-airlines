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
rese20 = Reservation.create seatRow: "1", seatColumn: "1"
rese21 = Reservation.create seatRow: "1", seatColumn: "2"
rese22 = Reservation.create seatRow: "1", seatColumn: "3"
rese23 = Reservation.create seatRow: "1", seatColumn: "4"
rese24 = Reservation.create seatRow: "2", seatColumn: "1"
rese25 = Reservation.create seatRow: "2", seatColumn: "2"
rese26 = Reservation.create seatRow: "2", seatColumn: "3"
rese27 = Reservation.create seatRow: "2", seatColumn: "4"
rese28 = Reservation.create seatRow: "3", seatColumn: "1"
rese29 = Reservation.create seatRow: "3", seatColumn: "2"
rese30 = Reservation.create seatRow: "3", seatColumn: "3"
rese31 = Reservation.create seatRow: "3", seatColumn: "4"
rese32 = Reservation.create seatRow: "4", seatColumn: "1"
rese33 = Reservation.create seatRow: "4", seatColumn: "2"
rese34 = Reservation.create seatRow: "4", seatColumn: "3"
rese35 = Reservation.create seatRow: "4", seatColumn: "4"
rese36 = Reservation.create seatRow: "5", seatColumn: "1"
rese37 = Reservation.create seatRow: "5", seatColumn: "2"
rese38 = Reservation.create seatRow: "5", seatColumn: "3"
rese39 = Reservation.create seatRow: "5", seatColumn: "4"
rese40 = Reservation.create seatRow: "6", seatColumn: "1"
rese41 = Reservation.create seatRow: "6", seatColumn: "2"
rese42 = Reservation.create seatRow: "6", seatColumn: "3"
rese43 = Reservation.create seatRow: "6", seatColumn: "4"
rese44 = Reservation.create seatRow: "7", seatColumn: "1"
rese45 = Reservation.create seatRow: "7", seatColumn: "2"
rese46 = Reservation.create seatRow: "7", seatColumn: "3"
rese47 = Reservation.create seatRow: "7", seatColumn: "4"
rese48 = Reservation.create seatRow: "8", seatColumn: "1"
rese49 = Reservation.create seatRow: "8", seatColumn: "2"
rese50 = Reservation.create seatRow: "8", seatColumn: "3"
rese51 = Reservation.create seatRow: "8", seatColumn: "4"
rese52 = Reservation.create seatRow: "9", seatColumn: "1"
rese53 = Reservation.create seatRow: "9", seatColumn: "2"
rese54 = Reservation.create seatRow: "9", seatColumn: "3"
rese55 = Reservation.create seatRow: "9", seatColumn: "4"
rese56 = Reservation.create seatRow: "10", seatColumn: "1"
rese57 = Reservation.create seatRow: "10", seatColumn: "2"
rese58 = Reservation.create seatRow: "10", seatColumn: "3"
rese59 = Reservation.create seatRow: "10", seatColumn: "4"
rese60 = Reservation.create seatRow: "11", seatColumn: "1"
rese61 = Reservation.create seatRow: "11", seatColumn: "2"
rese62 = Reservation.create seatRow: "11", seatColumn: "3"
rese63 = Reservation.create seatRow: "11", seatColumn: "4"
rese64 = Reservation.create seatRow: "12", seatColumn: "1"
rese65 = Reservation.create seatRow: "12", seatColumn: "2"
rese66 = Reservation.create seatRow: "12", seatColumn: "3"
rese67 = Reservation.create seatRow: "12", seatColumn: "4"
rese68 = Reservation.create seatRow: "13", seatColumn: "1"
rese69 = Reservation.create seatRow: "13", seatColumn: "2"
rese70 = Reservation.create seatRow: "13", seatColumn: "3"
rese71 = Reservation.create seatRow: "13", seatColumn: "4"
rese72 = Reservation.create seatRow: "14", seatColumn: "1"
rese73 = Reservation.create seatRow: "14", seatColumn: "2"
rese74 = Reservation.create seatRow: "14", seatColumn: "3"
rese75 = Reservation.create seatRow: "14", seatColumn: "4"
rese76 = Reservation.create seatRow: "15", seatColumn: "1"
rese77 = Reservation.create seatRow: "15", seatColumn: "2"
rese78 = Reservation.create seatRow: "15", seatColumn: "3"
rese79 = Reservation.create seatRow: "15", seatColumn: "4"
rese80 = Reservation.create seatRow: "16", seatColumn: "1"
rese81 = Reservation.create seatRow: "16", seatColumn: "2"
rese82 = Reservation.create seatRow: "16", seatColumn: "3"
rese83 = Reservation.create seatRow: "16", seatColumn: "4"
rese84 = Reservation.create seatRow: "17", seatColumn: "1"
rese85 = Reservation.create seatRow: "17", seatColumn: "2"
rese86 = Reservation.create seatRow: "17", seatColumn: "3"
rese87 = Reservation.create seatRow: "17", seatColumn: "4"
rese88 = Reservation.create seatRow: "18", seatColumn: "1"
rese89 = Reservation.create seatRow: "18", seatColumn: "2"
rese90 = Reservation.create seatRow: "18", seatColumn: "3"
rese91 = Reservation.create seatRow: "18", seatColumn: "4"
rese92 = Reservation.create seatRow: "19", seatColumn: "1"
rese93 = Reservation.create seatRow: "19", seatColumn: "2"
rese94 = Reservation.create seatRow: "19", seatColumn: "3"
rese95 = Reservation.create seatRow: "19", seatColumn: "4"
rese96 = Reservation.create seatRow: "20", seatColumn: "1"
rese97 = Reservation.create seatRow: "20", seatColumn: "2"
rese98 = Reservation.create seatRow: "20", seatColumn: "3"
rese99 = Reservation.create seatRow: "20", seatColumn: "4"
rese100 = Reservation.create seatRow: "21", seatColumn: "1"
rese101 = Reservation.create seatRow: "21", seatColumn: "2"
rese102 = Reservation.create seatRow: "21", seatColumn: "3"
rese103 = Reservation.create seatRow: "21", seatColumn: "4"
rese104 = Reservation.create seatRow: "22", seatColumn: "1"
rese105 = Reservation.create seatRow: "22", seatColumn: "2"
rese106 = Reservation.create seatRow: "22", seatColumn: "3"
rese107 = Reservation.create seatRow: "22", seatColumn: "4"
rese108 = Reservation.create seatRow: "23", seatColumn: "1"
rese109 = Reservation.create seatRow: "23", seatColumn: "2"
rese110 = Reservation.create seatRow: "23", seatColumn: "3"
rese111 = Reservation.create seatRow: "23", seatColumn: "4"
rese112 = Reservation.create seatRow: "24", seatColumn: "1"
rese113 = Reservation.create seatRow: "24", seatColumn: "2"
rese114 = Reservation.create seatRow: "24", seatColumn: "3"

puts "Created #{Reservation.all.length} reservations."

User.destroy_all

user0 = User.create name: "Luke Lemon", email: "luke.lemon@gmail.com", password: "chicken"
user1 = User.create name: "Bob Pilot", email: "bobby_boy@hotmail.com", password: "chicken"
user2 = User.create name: "John Bananas", email: "john@bananarama.com", password: "chicken"

puts "Created #{User.all.length} users."

# Adding the associations
user0.reservations << rese20 << rese21 << rese22 << rese23 << rese24 << rese25 << rese26 << rese27 << rese28 << rese29 << rese30 << rese31 << rese32 << rese33 << rese34 << rese35 << rese36 << rese37 << rese38 << rese39 << rese40 << rese41 << rese42 << rese43 << rese44 << rese45 << rese46 << rese47 << rese48 << rese49 << rese50 << rese51 << rese52 << rese53 << rese54 << rese55 << rese56 << rese57 << rese58 << rese59 << rese60 << rese61 << rese62 << rese63 << rese64 << rese65 << rese66 << rese67 << rese68 << rese69 << rese70 << rese71 << rese72 << rese73 << rese74 << rese75 << rese76 << rese77 << rese78 << rese79 << rese80 << rese81 << rese82 << rese83 << rese84 << rese85 << rese86 << rese87 << rese88 << rese89 << rese90 << rese91 << rese92 << rese93 << rese94 << rese95 << rese96 << rese97 << rese98 << rese99 << rese100 << rese101 << rese102 << rese103 << rese104 << rese105 << rese106 << rese107 << rese108 << rese109 << rese110 << rese111 << rese112 << rese113 << rese114
user1.reservations << rese2 << rese3
user2.reservations << rese4 << rese5 << rese6 << rese7 << rese15 << rese16 << rese8 << rese9 << rese10 << rese11

flig0.reservations
flig1.reservations << rese12 << rese13 << rese14
flig2.reservations << rese20 << rese21 << rese22 << rese23 << rese24 << rese25 << rese26 << rese27 << rese28 << rese29 << rese30 << rese31 << rese32 << rese33 << rese34 << rese35 << rese36 << rese37 << rese38 << rese39 << rese40 << rese41 << rese42 << rese43 << rese44 << rese45 << rese46 << rese47 << rese48 << rese49 << rese50 << rese51 << rese52 << rese53 << rese54 << rese55 << rese56 << rese57 << rese58 << rese59 << rese60 << rese61 << rese62 << rese63 << rese64 << rese65 << rese66 << rese67 << rese68 << rese69 << rese70 << rese71 << rese72 << rese73 << rese74 << rese75 << rese76 << rese77 << rese78 << rese79 << rese80 << rese81 << rese82 << rese83 << rese84 << rese85 << rese86 << rese87 << rese88 << rese89 << rese90 << rese91 << rese92 << rese93 << rese94 << rese95 << rese96 << rese97 << rese98 << rese99 << rese100 << rese101 << rese102 << rese103 << rese104 << rese105 << rese106 << rese107 << rese108 << rese109 << rese110 << rese111 << rese112 << rese113 << rese114
flig3.reservations << rese17 << rese18 << rese19
flig4.reservations
flig5.reservations << rese0 << rese1 << rese2 << rese4 << rese5 << rese6 << rese7 << rese15 << rese16 << rese8 << rese9 << rese10 << rese11
flig6.reservations
flig7.reservations
flig8.reservations << rese3

airp0.flights << flig0 << flig1 << flig2 << flig3 << flig4 << flig5 << flig6 << flig7 << flig15 << flig16 << flig17 << flig18 << flig19
airp1.flights << flig8 << flig9 << flig10 << flig11
airp2.flights << flig12 << flig13 << flig14
