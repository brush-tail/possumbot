thoughts = require '../modules'

messages = [
  '<name> is full of awesome',
  ]

module.exports = (robot) =>
  # example: possumbot flatter Kylie
  robot.respond /flatter (.*)/i, (res) =>
    name = res.match[1]
    output = res.random messages
    output = output.replace '<name>', name
    res.send output