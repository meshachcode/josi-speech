# Description:
#   Make your hubot chatty.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot get chatty - Makes hubot more chatty, providing detailed error reports and options for further action.
#   hubot (don't be chatty|stop chatty|be quiet|quiet|shut up|shuttup|stfu) - Makes hubot stfu.
#
# Author:
#   meshachjackson

class Chatty
  isChatty: true
  chats: []

  constructor: (@isChatty, robot) ->
    robot.brain.set 'chatty', @chats

  speak: (say) ->
    return say

  # TODO: Allow chatty to store chats with users,
  # so the bot can simply pick back up, and ask more questions.
  chat: () ->

  # TODO: Create a list of questions which are each 
  #   Response.expect promises, prepared to store the results.
  ask: () ->

  loud: () ->
    @isChatty = true

  quiet: () ->
    @isChatty = false

  oops: (expectation) ->
    "Oops! Something went wrong while I was trying to #{expectation}"

module.exports = (robot) ->

  isChatty = process.env.HUBOT_IS_CHATTY or false
  robot.chatty = new Chatty isChatty, robot

  robot.Response.prototype.chatty = (say, alt, cb) ->
    if alt
      @send robot.chatty.speak alt
    if robot.chatty.isChatty
      @send robot.chatty.speak say

  robot.respond /get chatty$/i, (msg) ->
    robot.chatty.loud()
    rep = "I'll be on the lookout for things to say!"
    if chats = robot.brain.get('chatty')
      rep = msg.random chats
    msg.send rep

  robot.respond /(don't be chatty|stop chatty|be quiet|quiet|shut up|shuttup|stfu)$/i, (msg) ->
    robot.chatty.quiet()
    msg.send "shh..."
