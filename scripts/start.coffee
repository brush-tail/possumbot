thoughts = require('../modules')

module.exports = (robot) =>
  robot.messageRoom 'bot-tests', "#{robot.name} is in the house!"
  robot.messageRoom 'bot-tests', "And I am awake"