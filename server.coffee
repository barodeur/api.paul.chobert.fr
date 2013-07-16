app = require('express')()

app.listen process.env.PORT || 3001

app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "X-Requested-With")
  next()

app.get '/infos/last-seen-at', require('./handlers/last-seen-at')
app.get '/infos/last-picture-taken', require('./handlers/last-picture-taken')
