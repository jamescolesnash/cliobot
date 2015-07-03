# Description:
#   So disappointed.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   disappointed! - Vocalize your emotions.
#
# Author:
#   rbroemeling

module.exports = (robot) ->
  regex = /(^|\W)disappointed(\W|$)/i
  robot.hear regex, (msg) ->
    msg.send "http://i.imgur.com/ldOXJ5E.gif"
