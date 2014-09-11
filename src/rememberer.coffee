# Description:
#   Reply the answer dependent on registered message
#
# Commands:
#   !<key> - Reply registered message by <key>
#   !<key> <msg> - Register <msg> as <key>

module.exports = (robot) ->
  robot.hear /^!([^ ]+)$/, (msg) ->
    key = msg.match[1]
    val = robot.brain.get key

    responseMsg = "\"#{key}\" is not registered"
    if val != null
      responseMsg = val
    msg.send responseMsg
  robot.hear /^!(.+?) (.+)/, (msg) ->
    key = msg.match[1]
    val = msg.match[2]
    robot.brain.set key, val
    msg.send "Registered \"#{val}\" as \"#{key}\""

