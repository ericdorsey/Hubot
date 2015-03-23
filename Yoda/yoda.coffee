# Commands
#   yoda me {some text} - hubot replies like Yoda
#
# Description
#   Hubot Yoda!
#   Uses the Yoda Speak API
#   https://www.mashape.com/ismaelc/yoda-speak#

module.exports = (robot) ->
  robot.respond /(yoda) (me) (.*)/i, (msg) ->
    #msg.reply "okay yoda" # Debugging; Did the Regex work?
    input_text = msg.match[3] # 3rd thing captured, ie word after 'yoda me'
    #msg.reply input_text # Outputs (local testing) "Shell: {whatever user input}"
    input_text = input_text.split(" ").join("+")
    myquery = "https://yoda.p.mashape.com/yoda" + "?sentence=" + input_text
    #msg.reply myquery # Debugging; output the HTTP GET string

    msg.http(myquery) # Header information provided by mashape.com, yoda-speak
      .headers(
        "X-Mashape-Key": "{insert your mashape x-mashape-key here}",
        "Accept": "text/plain"
      )
      .get() (err, res, body) ->
        if err
          msg.reply err
        msg.reply body

