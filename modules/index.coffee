# Checks if a message was said by the bot themselves
module.exports.self = (robot,res) =>
  if robot.name = res.message.user.name
    return true
  return false