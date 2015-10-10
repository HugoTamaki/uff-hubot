
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

module.exports = (robot) ->
  robot.hear /(\bporra\b|\bcaralho\b|\bputa\b|\bmerda\b|\bcu\b|\bpariu\b|\bpqp\b|\bfoder\b|\bfoda\b|\bfodeu\b|\bfudeu\b|\bfoda-se\b|\bfodasse\b|\bfodendo\b|\bfudendo\b|\bphoda\b|\bcacete\b|\bkct\b|\barrombado\b|\bescroto\b|\bescrotinho\b|\bfuderoso\b|\bputinha\b)/, (msg) ->
    randomNumber = Math.floor(Math.random() * (8 - 0 + 1)) + 0
    msg.send frases[randomNumber]    
