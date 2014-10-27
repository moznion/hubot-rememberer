# Description:
#   Reply the answer dependent on remembered message
#
# Commands:
#   !<key> - Reply remembered message by <key>
#   !<key> <msg> - Remember <msg> as <key>

module.exports = (robot) ->
  robot.hear /^!([^ ]+)$/, (msg) ->
    key = msg.match[1]
    val = robot.brain.get key

    responseMsg = "Don't know what \"#{key}\" is."
    if val != null
      responseMsg = val
    msg.send responseMsg
  robot.hear /^!(.+?) (.+)/, (msg) ->
    key = msg.match[1]
    val = msg.match[2]
    robot.brain.set key, val
    msg.send "Remembered \"#{val}\" as \"#{key}\""

