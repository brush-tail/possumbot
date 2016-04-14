thoughts = require('../modules')

room = process.env.NOTIFICATION_ROOM || 'evan'

module.exports = (robot) =>
  console.log('------------')
  console.log('robot',robot)
  console.log('robot.adapter.message',robot.adapter.message)
  console.log('robot.adapter.robot',robot.adapter.robot)
  robot.messageRoom room, "Fubar!"
  # robot.messageRoom room, "<https://github.com/link/to/a/PR|myrepo #42> fix some broken"
  
  # robot.messageRoom {room: room, text: "<https://github.com/link/to/a/PR|myrepo #42> fix some broken"}

  # robot.router.get '/', (req, res) ->
  #   robot.messageRoom 'bot-tests', "Ping! Right in the API."
  #   res.send '<html><body>Waking up</body></html>'
