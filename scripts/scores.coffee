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
#   hubot tally {p1} beat {p2}

module.exports = (robot) ->
  robot.respond /tally (.*) beat (.*)/, (res) ->
    winner = res.match[1]
    loser = res.match[2]
    #score = res.match[3]    # TODO: Keep a list of scores

    key1 = winner+'^'+loser
    key2 = loser+'^'+winner
    count       = robot.brain.get(key1) || 0
    othercount  = robot.brain.get(key2) || 0

    count += 1
    robot.brain.set key1, count

    res.send winner + " vs " + loser + ": " + count + " to " + othercount

    # unless answer?
    #   res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
    #   return
    # res.send "#{answer}, but what is the question?"