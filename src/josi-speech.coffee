# Description:
#
# Dependencies:
#   None
#
# Configuration:
#
# Commands:
#
# Author:
#   jollyscience

module.exports = (robot) ->

  robot.respond /persona/i, (msg) ->
    msg.send "JoSi Speech - Loaded"