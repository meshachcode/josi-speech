# Description:
#   Display a random quote or one from a specific person
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_QUOTE_MAX_LINES
#
# Commands:
#   hubot enlighten - random quote
#   hubot quote - random quote
#   hubot quote from <person> - quote from person
#
# Author:
#   cldwalker

<<<<<<< HEAD
reactions = [
  "Okay! How about...",
  "I've got the perfect thing...",
  "Let me see what I can find...",
  "Sit tight...",
  "You came to the right place."
]

=======
>>>>>>> cdf890acd890da4fb3734c0285f4e10c397ab05f
module.exports = (robot) ->
  robot.respond /enlighten|quote from (.*)|quote/i, (msg) ->
    params = {max_lines: process.env.HUBOT_QUOTE_MAX_LINES || '4'}
    if msg.match[1]
      params['source'] = msg.match[1].split(/\s+/).join('+')

<<<<<<< HEAD
    msg.send msg.random reactions
=======
>>>>>>> cdf890acd890da4fb3734c0285f4e10c397ab05f
    msg.http('http://www.iheartquotes.com/api/v1/random')
      .query(params)
      .get() (err, res, body) ->
        body = body.replace(/\s*\[\w+\]\s*http:\/\/iheartquotes.*\s*$/m, '')
        body = body.replace(/&quot;/g, "'")
        msg.send body
