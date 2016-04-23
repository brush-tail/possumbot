Firebase = require 'firebase'
FirebaseTokenGen = require 'firebase-token-generator'
url = process.env.FIREBASE_URL
token = process.env.FIREBASE_TOKEN
room = process.env.FIREBASE_ROOM

fbwatchkey = 'firebase_watchers'

module.exports = (robot) =>


  # DISABLED - Wanted to user brain but isn't working
  return


  if !url || !token
    if(room)
      robot.messageRoom room, 'My Firebase credentials are missing :('
    return

  fb = new Firebase url

  robot.messageRoom room, 'Attempting to connect to Firebase'

  fb.authWithCustomToken token, (error, authData) ->
    if error
      return robot.messageRoom room, 'Unable to authenticate with firebase'
    else
      robot.messageRoom room, 'Firebase Authenticated'

    fb.child('vectic').on 'child_added', (ssVectic) =>
      data = ssVectic.val()
      dataString = JSON.stringify data

      robot.messageRoom room, dataString

  # Receive watching commands
  robot.hear /test1/i, (res) ->
    robot.brain.set 'fubar', {test:'wee',fubar:'awww'}

  robot.hear /test2/i, (res) ->
    console.log robot.brain.get 'fubar'
    console.log robot.brain.get 'wee'

  robot.hear /test3/i, (res) ->
    robot.brain.set 'wee', 'grr'


  robot.respond /firebase (.*) into (.*)/i, (res) ->
    console.log('res.match',res.match)
    path = res.match[1]
    room = res.match[2]

    robot.brain.save {test:'aha!'}

    output = {}
    output[path] = room
    robot.brain.save output
