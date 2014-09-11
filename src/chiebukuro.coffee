# Description:
#   Reply the answer dependent on registered message
#
# Commands:
#   !<key> - Reply registered message by <key>
#   !<key> <msg> - Register <msg> as <key>

sqlite = require 'sqlite3'

fileName = __dirname + '/chiebukuro.db'
db = new sqlite.Database(fileName)

tableName = "response"

statementToSelect = ""
statementToReplace = ""
statementToCreateTable ="
  CREATE TABLE IF NOT EXISTS
    #{tableName} (key TEXT(255) PRIMARY KEY, res TEXT(255))
"
db.run statementToCreateTable, (err) ->
  if err != null
    console.error '[ERROR] Falied to create table in chiebukuro.coffee'
    return module.exports = (robot) -> # NOP

  statementToSelect = db.prepare "SELECT res FROM #{tableName} WHERE key = ?"
  statementToReplace = db.prepare "REPLACE INTO #{tableName} (key, res) VALUES (?, ?)"

module.exports = (robot) ->
  robot.hear /^!([^ ]+)$/, (msg) ->
    key = msg.match[1]
    statementToSelect.get key, (err, row) ->
      responseMsg = "\"#{key}\" is not registered"
      if err != null
        responseMsg = "Sorry, something wrong..."
      else if (row != undefined)
        responseMsg = row.res
      msg.send responseMsg
  robot.hear /^!(.+?) (.+)/, (msg) ->
    key = msg.match[1]
    val = msg.match[2]
    statementToReplace.run key, val, (err) ->
      responseMsg = "Registered \"#{val}\" as \"#{key}\""
      if err != null
        responseMsg = "Sorry, failed to register..."
      msg.send responseMsg

