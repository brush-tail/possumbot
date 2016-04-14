Firebase = require 'firebase'
FirebaseTokenGen = require 'firebase-token-generator'
url = process.env.FIREBASE_URL
token = process.env.FIREBASE_TOKEN
room = process.env.FIREBASE_ROOM

module.exports = (robot) =>
  if !url || !token
    if(room)
      robot.messageRoom room, 'My Firebase credentials missing :('
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