# Commands
#   hubot yoda me {some text} - hubot replies like Yoda
#
# Description
#   Hubot Yoda!
#   Uses the Yoda Speak API
#   https://www.mashape.com/ismaelc/yoda-speak#

special_char_replacements = {
  "@" : "at-sign"
  "#" : "pound-sign"
}

module.exports = (robot) ->
  robot.respond /(yoda) (me) (.*)/i, (msg) ->
    input_text = msg.match[3]
    input_text = input_text.split(" ").join("+")
    # replace special characters for the Yoda API.
    for i in input_text
      if special_char_replacements.hasOwnProperty(i)
        input_text = input_text.replace(i, special_char_replacements[i])

    myquery = "https://yoda.p.mashape.com/yoda" + "?sentence=" + input_text

    msg.http(myquery) # Header information provided by mashape.com, yoda-speak
      .headers(
        "X-Mashape-Key": "en1nzzQ4RpmshH30zvX1V1pMOEg4p1O0Oyrjsntr06l9TIzFvD",
        "Accept": "text/plain"
      )
      .get() (err, res, body) ->
        if err
          msg.reply "Problem with the API there is. Failed it did."
        else
          #replace the special characters again for outputting to user
          body = body.split("at-sign").join("@")
          body = body.split("pound-sign").join("#")
          msg.reply body

