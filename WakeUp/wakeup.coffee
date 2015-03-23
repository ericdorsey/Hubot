#Commands
#  hubot wake up - hubot replies to you in an unhelpful way

answers = [
  "*O_o*"
  "cupway!"
  "YOU wakeup"
  "cupway upcup way?"
  "#cupway?"
]

module.exports = (robot) ->
  robot.hear /[Ww]ake up(!|\?)?/ig, (msg) ->
    msg.reply msg.random answers
