# readClimateData

Code to read EC climate station data, specifically the climate station
at Oak Point, NB, Canada.

## readClimateData.R

Reads a `csv` obtained from the web at:
[Oak Point Climate data][OP]. Future versions will accept a date
(range?), and fetch the appropriate file using `curl`.

## To Do:

The goal is to create a script that can be run on a cron job to update
figures on a simple webpage showing the climate history over a variety
of time periods (weekly, monthly, seasonally, yearly, etc).

* fetch files from web

* pass date range to fetch files

* define plotting methods for the various data types, to make it easy
  to generate plots of a standard form quickly.




[OP]: http://www.climate.weatheroffice.gc.ca/climateData/dailydata_e.html?timeframe=2&Prov=NB&StationID=49868
