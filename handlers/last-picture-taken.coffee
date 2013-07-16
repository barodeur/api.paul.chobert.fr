request = require 'request'

INSTAGRAM_ACCESS_TOKEN = process.env.INSTAGRAM_ACCESS_TOKEN

module.exports = (req, res) ->
  request
    uri: "https://api.instagram.com/v1/users/4233576/media/recent/?access_token=#{INSTAGRAM_ACCESS_TOKEN}"
    json: true
    (err, response, body) ->
      res.send
        image:
          low: body.data[0].images.low_resolution.url
          standard: body.data[0].images.standard_resolution.url
        date: body.data[0].created_time
        caption: body.data[0].caption
