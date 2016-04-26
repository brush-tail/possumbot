Discord = require('discord.js')


noticeRoom = process.env.NOTIFICATION_ROOM
# https://www.npmjs.com/package/discord.io
discord = new Discord.Client()
discord.login process.env.DISCORD_EMAIL, process.env.DISCORD_PASSWORD

console.log 'discord',discord

module.exports = (robot) ->
  discord.on 'ready', () ->
    robot.messageRoom noticeRoom, robot.name+" has connected to discord as "+process.env.DISCORD_EMAIL

  discord.on 'message', (message) ->
    console.log 'message', message
    robot.messageRoom noticeRoom, "discord> "+message.content
