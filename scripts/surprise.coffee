
module.exports = (robot) ->
  
  words = [
      'praia',
      'clima',
      'frio',
      'quente',
      'calor',
      'sorvete',
      'congelando',
      'preguiça',
      'chuva',
      'vento'
    ]

  cold_frases = [
    'Tá ruim pra praia hein? Pena que não tá na dormindo agora :stuck_out_tongue:',
    'Se ferrou, não tem sol',
    'Tá bom pra ficar em casa!',
    'Muito frio ae?',
    'Quer um casaco?'
  ]

  hot_frases = [
    'Tá quente hoje, vai pra praia!',
    'Eu vou a praia, vocês vão?',
    'Estou morrendo de calor... pena que estão trabalhando ae :stuck_out_tongue:',
    'Vai um suquinho gelado ae?'
  ]

  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    getClimate msg, (url) ->
      climate = url.item.condition.text
      temp = url.item.condition.temp
      message = ""
      if (climate == 'Mostly Cloudy' || climate == 'Rain Shower') && ((temp - 32)/1.8000).toFixed(2) < 23.00
        randomNumber = Math.floor(Math.random() * (4 - 0 + 1)) + 0
        message += cold_frases[randomNumber]
      else if (climate == 'Fair' || climate == 'Partly Cloudy') && ((temp - 32)/1.8000).toFixed(2) >= 27.00
        randomNumber = Math.floor(Math.random() * (3 - 0 + 1)) + 0
        message += hot_frases[randomNumber]
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
      