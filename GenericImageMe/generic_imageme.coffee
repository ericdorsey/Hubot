# Commands
#   $ image me {some text} - hubot retrieves the image (alt. usage: $ img me {some text})
#
# Description
#   Just like image me without the @ needed

module.exports = (robot) ->
  robot.hear /((\$ image) (me)|(\$ img) (me)) (.*)/i, (msg) ->
    msg.send msg
    imageMe msg, msg.match[3], (url) ->
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