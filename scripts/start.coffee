thoughts = require('../modules')

module.exports = (robot) =>
  robot.messageRoom 'bot-tests', "#{robot.name} is in the house!"