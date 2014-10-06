# Description:
#   Hubot responds any thank message politely
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot thank[s] [you] - Hubot accepts your thanks
#
# Author:
#   github.com/delucas
#

thanks = [
  "you're welcome",
  "no problem",
  "not at all",
  "don’t mention it",
  "it’s no bother",
  "it’s my pleasure",
  "my pleasure",
  "it’s all right",
  "it’s nothing",
  "think nothing of it",
  "sure",
  "sure thing"
]

module.exports = (robot) ->
  robot.respond /.*(thank).*/i, (msg) ->
    msg.send msg.random thanks