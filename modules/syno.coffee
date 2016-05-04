Syno = require 'syno'

# https://www.npmjs.com/package/syno

_canStart = true

if !process.env.SYNOLOGY_PROTOCOL
  _canStart=false
  console.error 'Missing env param: SYNOLOGY_PROTOCOL'
if !process.env.SYNOLOGY_HOST
  _canStart=false
  console.error 'Missing env param: SYNOLOGY_HOST'
if !process.env.SYNOLOGY_PORT
  _canStart=false
  console.error 'Missing env param: SYNOLOGY_PORT'
if !process.env.SYNOLOGY_ACCOUNT
  _canStart=false
  console.error 'Missing env param: SYNOLOGY_ACCOUNT'
if !process.env.SYNOLOGY_PASSWORD
  _canStart=false
  console.error 'Missing env param: SYNOLOGY_PASSWORD'


if !_canStart
  module.exports = {}
  return

syno = new Syno(
  protocol: process.env.SYNOLOGY_PROTOCOL,
  host: process.env.SYNOLOGY_HOST,
  port: process.env.SYNOLOGY_PORT,
  account: process.env.SYNOLOGY_ACCOUNT,
  password: process.env.SYNOLOGY_PASSWORD)

module.exports = syno