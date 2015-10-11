
# um script para identificar palavrões e mandar mensagens recriminando os usuários

frases = [
  "Não fale palavrões!",
  "caraca, eu te avisei....",
  "Tá andando muito com a Maria!",
  "acho melhor lavar sua boca...",
  "não diga isso! Tem meninas aqui!",
  "não diga isso! Tem meninas aqui! Bem, na verdade são succubus ne?",
  "por que você é assim?",
  "Elberth está olhando",
  "Maria, para com isso!"
]

words = [
  'porra',
  'caralho',
  'puta',
  'merda',
  'cu',
  'puta que pariu',
  'arrombado',
  'arrombada',
  'foder',
  'foda',
  'fuder',
  'foder',
  'foda-se',
  'fodasse',
  'fodendo',
  'fudendo',
  'phoda',
  'cacete',
  'kct',
  'escroto',
  'escrotinho',
  'fuderoso',
  'putinha',
  'puta'
]

regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    randomNumber = Math.floor(Math.random() * (8 - 0 + 1)) + 0
    msg.send frases[randomNumber]    
