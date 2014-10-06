# Description:
#   Returns a random trivia from https://www.mashape.com/divad12/numbers-1
#
# Configuration:
#   HUBOT_MASHAPE_NUMBERS_API_KEY - API Key
#
# Commands:
#   hubot math facts - Gets a trivia fact.
#
# Author:
#   delucas

unirest = require('unirest')

module.exports = (robot) ->
  robot.respond /math me$/i, (msg) ->
    if not process.env.HUBOT_MASHAPE_NUMBERS_API_KEY
      return msg.send "You need to set HUBOT_MASHAPE_NUMBERS_API_KEY to get math facts!"
    unirest.get("https://numbersapi.p.mashape.com/random/trivia?fragment=true&json=false")
    .header("X-Mashape-Key", process.env.HUBOT_MASHAPE_NUMBERS_API_KEY)
    .end((response) ->
      msg.send("##{response.body.number}: #{response.body.text}"))

  robot.respond /math me\s+(\d+)$/i, (msg) ->
    num = "#{msg.match[1]}"
    if not process.env.HUBOT_MASHAPE_NUMBERS_API_KEY
      return msg.send "You need to set HUBOT_MASHAPE_NUMBERS_API_KEY to get math facts!"
    unirest.get("https://numbersapi.p.mashape.com/#{num}/trivia?fragment=true&json=true&notfound=floor")
    .header("X-Mashape-Key", process.env.HUBOT_MASHAPE_NUMBERS_API_KEY)
    .end((response) ->
      msg.send("##{response.body.number}: #{response.body.text}"))
