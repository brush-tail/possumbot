Firbase = require 'firebase'
FirebaseTokenGen = require 'firebase-token-generator'

module.exports = (robot) =>
  if !process.env.FIREBASE_URL || !process.env.FIREBASE_TOKEN
    return robot.messageRoom 'vectic-watch', 'My Firebase credentials missing :('

  fb = new Firebase process.env.FIREBASE_URL

  fb.authWithCustomToken process.env.FIREBASE_TOKEN, (error, authData) ->
    if error
      return robot.messageRoom 'vectic-watch', 'Unable to authenticate with firebase'
    else
      robot.messageRoom 'vectic-watch', 'Firebase Authenticated'

    fb.child('vectic').on 'child_added', (ssVectic) =>
      data = ssVectic.val()
      dataString = JSON.stringify data

      robot.messageRoom 'vectic-watch', dataString