
module.exports = (robot) ->
  
  words = [
      'tempo',
      'praia',
      'clima',
      'frio',
      'quente',
      'calor',
      'sorvete',
      'congelando',
      'preguiça'
    ]

  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    getClimate msg, (url) ->
      climate = url.item.condition.text
      temp = url.item.condition.temp
      message = ""
      if (climate == 'Mostly Cloudy' || climate == 'Rain Shower') && ((temp - 32)/1.8000).toFixed(2) < 22.00
        message += 'Tá ruim pra praia hein? Pena que não tá na dormindo agora :stuck_out_tongue:'
      else if (climate == 'Fair') && ((temp - 32)/1.8000).toFixed(2) >= 22.00
        message += 'Tá quente hoje, vai pra praia!'
      msg.send message unless message == ""

getClimate = (msg, cb) ->
  climate =
    base_url: 'https://query.yahooapis.com/v1/public/yql'

  city = 'Niterói'
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
      