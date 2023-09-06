
extends = /model/basic/autoinput.pl

# Specific keys


sol ==
Tirana
Berlin
Andorre-la-Vieille
Erevan
Vienne
Bakou
Bruxelles
Minsk
Sarajevo
Sofia
Zagreb
Copenhague
Madrid
Tallinn
Helsinki
Paris
Tbilissi
Athènes
Budapest
Dublin
Reykjavik
Rome
Riga
Vaduz
Vilnius
Luxembourg
Skopje
LaValette
Chisinau
Monaco
Podgorica
Oslo
Amsterdam
Varsovie
Lisbonne
Prague
Bucarest
Londres
Moscou
Saint Marin
Belgrade
Bratislava
Ljubljana
Stockholm
Berne
Ankara
Kiev
Vatican
==

items ==
Pretoria
Cape Town
Bloemfontein
Algiers
Tashkent
Santiago
Singapore
Vaduz
Manama
Yerevan
Belgrade
Canberra
Buenos Aires
Lima
Pyongyang
Phnom Penh
Dili
N'Djamena
Wellington
New Delhi
Funafuti
Nuku'alofa
Apia
Honiara
Port Vila
Port Moresby
Ngerulmud
Yaren District
Palikir
Kolonia
Majuro
South Tarawa
Ulaanbaatar
Suva
Caracas
Paramaribo
Asunción
Georgetown
Quito
Bogotá
La Paz
Sucre
Port of Spain
Kingstown
Castries
Basseterre
Kingston
St. George's
Guatemala City
Nassau
Saint John's
Tegucigalpa
Roseau
Santo Domingo
Port-au-Prince
San Salvador
Tehran
Baghdad
San José
Jerusalem
Panama City
Sanaa
Aden
Amman
Managua
Bishkek
Kuwait City
Vientiane
Beirut
Malé
Kuala Lumpur
Naypyidaw
Kathmandu
Muscat
Islamabad
Doha
Riyadh
Colombo
Sri Jayawardenepura Kotte
Damascus
Dushanbe
Taipei
Bangkok
Ashgabat
Abu Dhabi
Hanoi
Seoul
Kabul
Dhaka
Bamako
Luanda
Thimphu
Bandar Seri Begawan
Dodoma
Manila
Bangui
Lomé
Tunis
Lusaka
Harare
Juba
Porto-Novo
Ramallah
Copenhagen
Geneva
Ottawa
Tokyo
Oslo
Dublin
Budapest
Madrid
"Washington, D.C."
City of Brussels
Luxembourg
Helsinki
Stockholm
Varsovie
Vilnius
Rome
Bern
Vienna
Athens
Ankara
Lisbon
Montevideo
Cairo
Mexico City
Nairobi
Addis Ababa
Accra
Paris
London
Beijing
Brasília
Moscow
Berlin
Minsk
Reykjavík
Tallinn
Riga
Kyiv
Prague
Bratislava
Ljubljana
Chișinău
Bucharest
Sofia
Skopje
Tirana
Zagreb
Sarajevo
Baku
Andorra la Vella
Nicosia
Tbilisi
Astana
Valletta
Monaco City
Podgorica
Vatican City
San Marino
Havana
Belmopan
Bridgetown
Jakarta
Gaborone
Ouagadougou
Gitega
Moroni
Brazzaville
Kinshasa
Djibouti
Malabo
Asmara
Libreville
Banjul
Conakry
Bissau
Yamoussoukro
Yaoundé
Praia
Maseru
Monrovia
Tripoli
Antananarivo
Lilongwe
Nouakchott
Port Louis
Rabat
Maputo
Windhoek
Niamey
Abuja
Kampala
Kigali
São Tomé
Dakar
Victoria
Freetown
Mogadishu
Khartoum
Mbabane
Lobamba
Amsterdam
==

prefix = "Réponse :"

# Question and input block

question ==

#un exemple avec plein de bonnes réponses


Citez une capitale européennes
==

before==

# je n'ai pas le temps de vérifier que toutes les réponses sont dans la liste des items.
for x in sol.split("\n"):
    if x not in items.split("\n"):
        # question += "not "+x 
        items += x +"\n"
==