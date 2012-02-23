# Show current local time of different timezons
#
# timezone - Dispaly all timezones (currently only have 2: shanghai & san francisco)
# timezone me <offset> - Display specific timezones (e.g. timezone me -8, tz me 1, 2, 3)
#

moment = require 'moment'

module.exports = (robot) ->
  timezone = new Timezone robot
  robot.enter (msg) ->
    msg.send timezone.cities()
  robot.respond /timezone$/i, (msg) ->
    msg.send timezone.cities()
  robot.respond /(timezone|tz)( me)? (.*)/i, (msg) ->
    offsets = msg.match[3].split ','
    cities = {}
    cities["[Timezone #{offset.trim()}]"] = parseInt(offset, 10) for offset in offsets
    msg.send timezone.cities cities

class Timezone
  constructor: (@robot) ->

  cities: (cities = "San Francisco": -8, "Shanghai": 8) ->
    response = 'World Clock (Timezone)\n'
    for own city, offset of cities
      response += "#{city}:\t#{@localTime offset}\n"
    response

  localTime: (offset) ->
    now = moment()
    now.add('hours', now.zone()/60).add('hours', offset).format('dddd, MMMM Do YYYY, h:mm:ss A')
