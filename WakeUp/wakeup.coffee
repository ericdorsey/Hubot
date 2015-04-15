#Commands
#  hubot hears cupway - hubot replies in an unhelpful way
#  hubot hears wake up - hubot replies in an unhelpful way

answers = [
  "*O_o*"
  "cupway!"
  "cupway upcup way?"
  "#waycup?"
  "*cup up way*"
  "Not a good idea."
]

cupway_answers = [
  "Someone thinks I should respond to 'cupway'"
  "cupwayupcup?"
  "*upcupwaycup*"
  "Cup... *way*?"
  "All the way cup?"
  "Coffee would be required."
]

module.exports = (robot) ->
  robot.hear /wake up(!|\?)?/ig, (msg) ->
    msg.send msg.random answers

  robot.hear /#?cupway(!|\?)?/ig, (res) ->
    rand_num = (Math.floor(Math.random() * 1) + 1)
    setTimeout () ->
      res.send res.random cupway_answers
    , rand_num * 1000

