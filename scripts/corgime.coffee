# Description:
#   Corgi Me script similar to Pug Me
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot corgi me - Receive a corgi
#   hubot corgi bomb N - get N corgis

module.exports = (robot) ->

  robot.respond /corgi me/i, (msg) ->
    msg.http("http://corgi-me.appspot.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).corgi

  robot.respond /corgi bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http("http://corgi-me.appspot.com/bomb?count=" + count)
      .get() (err, res, body) ->
        msg.send corgi for corgi in JSON.parse(body).corgis

  robot.respond /stumps/i, (res) ->
    res.send "My stumps are for splooting."

  robot.respond /love you/i, (res) ->
    res.reply "I love you too with all my stumps."

  robot.respond /have a bone/i, (res) ->
    res.send "om nom noms: https://s-media-cache-ak0.pinimg.com/originals/ed/7e/3d/ed7e3d59122658562db4c0030cb90fe3.gif"
