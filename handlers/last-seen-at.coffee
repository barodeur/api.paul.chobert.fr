request = require('request')

FOURSQUARE_ACCESS_TOKEN = process.env.FOURSQUARE_ACCESS_TOKEN

module.exports = (req, res) ->
  request
    url: "https://api.foursquare.com/v2/users/self?oauth_token=#{FOURSQUARE_ACCESS_TOKEN}"
    json: true
    (err, response, body) ->
      checkin = body.response.user.checkins.items[0]
      res.send
        checkin: checkin
        date: checkin.createdAt
        venue:
          name: checkin.venue.name
          location: checkin.venue.location
          url: checkin.venue.canonicalUrl
