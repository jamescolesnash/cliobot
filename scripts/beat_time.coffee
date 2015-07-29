# Description:
#   Displays the current time in Internet Time (.beats). FUCK THE SUN!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   beat time, swatch time, internet time - Print the current time in .beats.
#
# Author:
#   fimmtiu

module.exports = (robot) ->
  robot.respond /(beat|swatch|internet) time\??$/i, (msg) ->
    msg.send "@#{beatTime(new Date())}"

beatTime = (date, decimals = 1) ->
  date.setUTCHours(date.getUTCHours() + 1)    # Beat time uses UTC + 1, because they're assholes.
  beats = (date.getUTCSeconds() + date.getUTCMinutes() * 60 + date.getUTCHours() * 3600) / 86.4
  beats.toFixed(decimals)
