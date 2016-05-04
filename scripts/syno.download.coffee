syno = require '../modules/syno'

if !syno
  return

module.exports = (robot) ->
  robot.respond /dl (.*)/i, (res) ->
    res.send 'TODO'

  robot.respond /dl (.*)/i, (res) ->
    syno.dl.listFiles {}, (data1, data2) ->
      console.log 'syno dl list data1', data1
      console.log 'syno dl list data2', data2
      res.send 'TODO'