
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
  robot.hear /(\bporra\b|\bcaralho\b|\bputa\b|\bmerda\b|\bcu\b|\bpariu\b|\bpqp\b|\bfoder\b|\bfoda\b|\bfodeu\b|\bfudeu\b|\bfoda-se\b|\bfodasse\b|\bfodendo\b|\bfudendo\b|\bphoda\b|\bcacete\b|\bkct\b)/, (msg) ->
    randomNumber = Math.floor(Math.random() * (8 - 0 + 1)) + 0
    msg.send frases[randomNumber]    
