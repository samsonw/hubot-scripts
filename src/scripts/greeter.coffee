module.exports = (robot) ->
  robot.enter (msg) ->
    msg.reply greeting_msg()

greeting_msg = ->
  time = get_offset_timezone_hour(8)
  if 2 <= time <= 5
    'Are you crazy?  It\'s only ' + time + ' in the morning!  (GMT+8 for the record...)'
  else if 6 <= time <= 11
    'Good morning, welcome back!'
  else if time is 12
    'Finish lunch?'
  else if 13 <= time <= 17
    'Good afternoon, welcome back!'
  else if time is 18
    'Dinner?'
  else if 19 <= time <= 24 || 0 <= time <= 1
    'Good evening, welcome back!'
  else
    'Welcome back!'

get_offset_timezone_hour = (offset) ->
  d = new Date()
  new Date(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate(), d.getUTCHours() + offset, d.getUTCMinutes(), d.getUTCSeconds()).getHours()
