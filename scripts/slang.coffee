
# um script para identificar palavrões e mandar mensagens recriminando os usuários

frases = [
  "Não fale palavrões!",
  "tsc tsc, esse não parece com você...",
  "Começou a estudar computação e ficou assim?",
  "acho melhor lavar sua boca...",
  "não diga isso! Tem meninas aqui!",
  "vou contar pra sua mãe!",
  "estou envergonhado...",
  "Elberth está olhando",
  "Não diga essas coisas!"
]

module.exports = (robot) ->
  robot.hear /\b(porra)|caralho|puta|merda|cu|pariu|pqp|foder|foda|phoda|cacete|kct|\b/i, (msg) ->
    randomNumber = Math.floor(Math.random() * (8 - 0 + 1)) + 0
    msg.send frases[randomNumber]    
