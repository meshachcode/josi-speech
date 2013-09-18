# Description:
#   Polite.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot (thanks|thank you|cheers|nice one) - hubot replies with something like "You"re welcome."
#   hubot (ty|thx) - hubot replies with something like "vw"
#   hubot (hello|hi|sup|howdy|good (morning|evening|afternoon)) - hubot replies with something like "Ahoy!"
#   hubot (bye|night|goodbye|good night) - hubot replies with something like "Goodbye"
# 
# Author:
#   dannymcc

greetings = [
  "Ahoy!",
  "Sup...",
  "Not now, I\"m learning kung fu.",
  "What!?!?! Geeze...",
  "Hey! It really has been too long...\nHow have you been?",
  "Aloha.",
  "Hola!",
  "Happ'nin?",
  "yo"
]

responses = [
  "You're welcome.",
  "No problem.",
  "Anytime.",
  "That's what I'm here for!",
  "You are more than welcome.",
  "You don't have to thank me, I'm your loyal servant.",
  "Don't mention it."
]

shortResponses = [
  "vw",
  "np",
]

farewellResponses = [
  "Goodbye",
  "Have a good evening",
  "Bye",
  "Take care",
  "Nice speaking with you",
  "See you later"
]

# http://en.wikipedia.org/wiki/You_talkin"_to_me%3F
youTalkinToMe = (msg, robot) ->
  input = msg.message.text.toLowerCase()
  name = robot.name.toLowerCase()
  input.indexOf(name) != -1

module.exports = (robot) ->
  robot.respond /\b(thanks|thank you|cheers|nice one)\b/i, (msg) ->
    msg.send msg.random responses if youTalkinToMe(msg, robot)

  robot.respond /\b(ty|thx)\b/i, (msg) ->
    msg.send msg.random shortResponses if youTalkinToMe(msg, robot)

  robot.respond /\b(hello|hi|sup|howdy|good (morning|evening|afternoon))\b/i, (msg) ->
    msg.send msg.random greetings if youTalkinToMe(msg, robot)
    
  robot.respond /\b(bye|night|goodbye|good night)\b/i, (msg) ->
    msg.send msg.random farewellResponses if youTalkinToMe(msg, robot)