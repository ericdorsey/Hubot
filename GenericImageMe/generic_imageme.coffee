# Commands
#   $ image me {some text} - hubot retrieves the image (or $ img me {some text})
#   $ image me -r - hubot retrieves a random image (or $ img me -r)
#
# Description
#   Image me without the @hubot needed
#   Or get a random image!

module.exports = (robot) ->
  robot.hear /((\$ image) (me)|(\$ img) (me)) (.*)/i, (msg) ->
    imageMe msg, msg.match[6], (url) ->
      msg.send url

  robot.hear /(((\$ image) (me)|(\$ img) (me)) (\-r))/i, (msg) ->
    msg.http('http://randomword.setgetgo.com/get.php')
    .headers(
      "Accept": "text/jsonp"
    )
    .get() (err, res, body) ->
      if err
        msg.send "Problem with the randomword.setgetgo.com word API."
      else
        random_word = body
        msg.send "Random word found: " + random_word
        imageMe msg, random_word, (url) ->
          msg.send url


imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
  .query(q)
  .get() (err, res, body) ->
    images = JSON.parse(body)
    images = images.responseData?.results
    if images?.length > 0
      image = msg.random images
      cb ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"