

# Luffy meilleur perso

# bon voyage au Japon


##bonjur
  
routes = read.csv("routes.txt")
agency = read.csv("agency.txt")
calendar = read.csv("calendar.txt")
stop_times = read.csv("stop_times.txt")
stops = read.csv("stops.txt")
trips = read.csv("trips.txt")

# install.packages("sqldf")
library(sqldf)
# nobre de trips

sqldf("select count(*) as nombre 
      from trips")

sqldf("select count(*) as nombre 
      from routes")

sqldf("select count(*) as nombre 
      from stops")

# 5 premières lignes de stop

sqldf("select * 
      from stops
      limit 5")


# nombre d'arret dans chaque trips

R1 = sqldf("
      select count(*) as Nbarret, trip_id
      from stop_times 
      group by trip_id
      ")

# Le trip avec plus de stops

sqldf("
      select max(Nbarret), trip_id
      from R1
      ")

# Les routes avec plus de 500 trips

sqldf("
      select route_id, count(*) as nbtrips
      from trips 
      group by route_id
      having nbtrips > 500
      ")

# Le stop avec le plus de trips

sqldf("
      select count(*) as Ntrip, stop_id
      from stop_times 
      group by stop_id
      order by Ntrip desc
      limit 1
      ")


library(XML)

library(RCurl)


resp = htmlParse(getURL("https://www.leboncoin.fr/jardinage/offres/centre"), useInternal = T)
resp

getNodeSet(resp, "__NEXT_DATA__")

library(rvest)

