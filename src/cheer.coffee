# Description:
#   Feeling depressed?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cheer me up - A little pick me up
#
# Author:
#   carllerche

<<<<<<< HEAD
reactions = [
  "I would love nothing more.",
  "Awe... You should see this.",
  "Okay! How about...",
  "I've got the perfect thing...",
  "You are just going to love this...",
  "Let me see what I can find...",
  "Sit tight...",
  "You came to the right place."
]

=======
>>>>>>> cdf890acd890da4fb3734c0285f4e10c397ab05f
module.exports = (robot) ->
  robot.respond /cheer me up/i, (msg) ->
    aww msg

  robot.hear /i( am|'m) emo/i, (msg) ->
    msg.send "Let me cheer you up."
    aww msg

aww = (msg) ->
<<<<<<< HEAD
  msg.send msg.random reactions
=======
>>>>>>> cdf890acd890da4fb3734c0285f4e10c397ab05f
  msg
    .http('http://imgur.com/r/aww.json')
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        image  = msg.random images
        msg.send "http://i.imgur.com/#{image.hash}#{image.ext}"
