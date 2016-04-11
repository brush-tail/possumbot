thoughts = require('../modules')

module.exports = (robot) =>
  robot.messageRoom 'bot-tests', "#{robot.name} has woken up"

  robot.router.get '/', (req, res) ->
    robot.messageRoom 'bot-tests', "Ping! Right in the API."
    res.send '<html><body>Waking up</body></html>'