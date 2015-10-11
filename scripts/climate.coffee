# Description:
#   A way to get weather forecast for the day at a certain place
#
# Commands:
#   hubot climate me <query> - Returns info about weather of somewhere

climate =
  base_url: 'https://query.yahooapis.com/v1/public/yql'

module.exports = (robot) ->
  robot.hear /(climate)( me)? (.*)/i, (msg) ->
    getClimate msg, msg.match[3], (url) ->
      message = ""
      message += "#{url.item.title} - #{url.location.country}\n"
      message += "Temperature: #{((url.item.condition.temp - 32)/1.8000).toFixed 2} ºC\n"
      message += "#{url.item.condition.text}\n"
      message += "lat: #{url.item.lat}, long: #{url.item.long}\n"
      msg.send message

getClimate = (msg, city, cb) ->
  query = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where text='#{city}')"
  url = "#{climate.base_url}"

  msg.http(url)
    .query
      q: query,
      format: 'json'
    .get() (err, res, body) ->
      response = undefined
      try
        response = JSON.parse(body)
        result = response.query.results.channel
        cb result
      catch e
        response = undefined

      return if response is undefined
      