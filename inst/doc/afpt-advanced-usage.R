## -----------------------------------------------------------------------------
library('afpt')

## -----------------------------------------------------------------------------
myBird <- Bird(
  massTotal = 0.215, #  weight in kg
  wingSpan = 0.67,  #  wingspan in m
  wingArea = 0.0652, #  wing area in m2
  wingbeatFrequency = 5,
  name = 'Jackdaw',
  name.scientific = 'Corvus monedula',
  type = 'passerine',
  source = 'KleinHeerenbrink M, Warfvinge K and Hedenstrom A (2016) J.Exp.Biol. 219: 10, 1572--1581'
)

## -----------------------------------------------------------------------------
flightCondition.ISA0 <- afpt:::ISA0
flightCondition.ISA3 <- list(
  density = 0.9093, # [kg/m3] 3 km altitude
  gravity = 9.81, # [m/s2]
  viscosity = 18.63E-6, # [m2/s] 3 km altitude
  windSpeed = 0,# [m/s]
  windDir = 0 # [degrees] 0 degrees means wind is along the track direction
)

## -----------------------------------------------------------------------------
flightperf.ISA0 <- computeFlightPerformance(myBird,flightcondition=flightCondition.ISA0,frequency='recompute')
flightperf.ISA3 <- computeFlightPerformance(myBird,flightcondition=flightCondition.ISA3,frequency='recompute')
list(frequency.ISA0 = flightperf.ISA0$table$frequency,frequency.ISA3 = flightperf.ISA3$table$frequency)

## -----------------------------------------------------------------------------
COT.ISA0 <- with(flightperf.ISA0$table,power.chem/speed)
COT.ISA3 <-with(flightperf.ISA3$table,power.chem/speed)
list(ISA0 = COT.ISA0, ISA3 = COT.ISA3)
COT.ISA3/COT.ISA0

