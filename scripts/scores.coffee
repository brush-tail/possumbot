# Description:
#   Keeps a tally of 1vs1 scores
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tally {p1} beat {p2} - Adds +1 to tally for player on left
#   hubot tally players - Returns all results for all players

module.exports = (robot) ->
  robot.respond /tally (.*) beat (.*)/i, (res) ->
    p1 = res.match[1]
    p2 = res.match[2]
    #score = res.match[3]    # TODO: Keep a list of scores

    key1 = 'tally_'+p1+'^'+p2
    key2 = 'tally_'+p2+'^'+p1
    count       = robot.brain.get(key1) || 0
    othercount  = robot.brain.get(key2) || 0

    count += 1
    robot.brain.set 'tally_'+key1, count

    players = robot.brain.get('tally_players') || []

    if players.indexOf p1 < 0
      players.push p1
    if players.indexOf p2 < 0
      players.push p2
    robot.brain.set 'tally_players', players

    res.send p1 + " vs " + p2 + ": " + count + " to " + othercount

  robot.respond /tally players/i, (res) ->
    tally = 'Players stored are:'
    players = robot.brain.get('tally_players') || []

    completed = {}

    i1 = 0
    i2 = 0
    while i1 < players.length
      i1++
      p1 = players[i1]
      while i2 < players.length
        i2++
        p2 = players[i2]
        if p1 == p2
          continue
        if completed[p1+'_'+p2] || completed[p2+'_'+p1]
          continue

        key1 = 'tally_'+p1+'^'+p2
        key2 = 'tally_'+p2+'^'+p1
        count1 = robot.brain.get(key1) || 0
        count2 = robot.brain.get(key2) || 0
        tally += '\n' + p1 + ' vs ' + p2 + ': ' + count1 + ' to ' + count2
        completed[p1+'_'+p2] = true

    res.send tally