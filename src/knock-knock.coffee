# Description:
#
# Dependencies:
#   None
#
# Configuration:
#
# Commands:
#
# Notes:
#
# Author:
#   meshachjackson

module.exports = (robot) ->

  answer = null

  robot.router.get '/hubot/ping', (req, res) ->
    res.send('pong')

#####################
# Round 1 ###########
#####################
  robot.respond /(make me laugh|knock knock)/i, (msg) ->
    console.log "######## ROUND 1 #############"
    msg.send "Knock knock"
    msg.waitResponse (msg) ->
        answer = new RegExp("who('s|s| is) there?")
        if !answer.test(msg.match[1])
            msg.send "Awe... You are supposed to say \"#{answer}\""
        else
            msg.send "banana"
            msg.waitResponse (msg) ->
                answer = new RegExp("banana who?")
                if !answer.test(msg.match[1])
                    msg.send "Dude. Have you really never seen how this is done?"
                else
                    #####################
                    # Round 2 ###########
                    #####################
                    console.log "######## ROUND 2 #############"
                    msg.send "Knock knock..."
                    msg.waitResponse (msg) ->
                        console.log msg
                        answer = new RegExp("who('s|s| is) there?")
                        if !answer.test(msg.match[1])
                            msg.send "Shucks. We were almost there..."
                        else
                            msg.send = "banana"
                            msg.waitResponse (msg) ->
                                answer = new RegExp("banana who?")
                                if !answer.test(msg.match[1])
                                    msg.send "Dude. Have you really never seen how this is done?"
                                else
                                    #####################
                                    # Round 3 ###########
                                    #####################
                                    console.log "######## ROUND 3 #############"
                                    msg.send "Knock knock..."
                                    msg.waitResponse (msg) ->
                                        answer = new RegExp("who('s|s| is) there?")
                                        if !answer.test(msg.match[1])
                                            msg.send "Dude. Have you really never seen how this is done?"
                                        else
                                            msg.send = "orange"
                                            answer = new RegExp("orange who?")
                                            if !answer.test(msg.match[1])
                                                msg.send "Dude. Have you really never seen how this is done?"
                                            else
                                                #####################
                                                # Punchline #########
                                                #####################
                                                msg.send "Orange you glad I didn't say banana!"
                                                msg.message.text = "#{robot.name} animate me banana"
                                                robot.receive msg.message