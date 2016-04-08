module.exports = (robot) =>
  # Check if bot said it
  self = (res) ->
    if robot.name = res.message.user.name
      return true
    return false

  # example: possumbot flatter Kylie
  robot.respond /flatter (.*)/i, (res) =>
    name = res.match[1]
    res.send name+' is full of awesome!'