# Description:
#   Random jokes from /r/jokes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot joke me - Pull a random joke from /r/jokes
#
# Author:
#   tombell

reactions = [
  "I would love nothing more.",
  "Psht... Get ready to wet your pants...",
  "Okay! How about...",
  "I've got the perfect thing...",
  "You are just going to love this...",
  "Let me see what I can find...",
  "Sit tight...",
  "You came to the right place."
]

module.exports = (robot) ->

  robot.respond /joke me/i, (msg) ->
    msg.send msg.random reactions
    msg.http('http://www.reddit.com/r/jokes.json')
      .get() (err, res, body) ->
        try
          data = JSON.parse body
          children = data.data.children
          joke = msg.random(children).data

          if joke.selftext.match /^\.\.\./
            joketext = joke.title.replace(/\*\.\.\.$/,'') + ' ' + joke.selftext.replace(/^\.\.\.\s*/, '')
          else
            joketext = joke.selftext

          msg.send joketext.trim()

        catch ex
          msg.send "Erm, something went EXTREMELY wrong - #{ex}"
