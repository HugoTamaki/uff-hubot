photos = [
  "http://postimg.org/image/dsmebje7x/",
  "http://postimg.org/image/orfsx7tvr/",
  "http://postimg.org/image/nlcxn79yt/",
  "http://postimg.org/image/m37hwzogf/",
  "http://postimg.org/image/8nn93dw1t/"
]

module.exports = (robot) ->
  robot.hear /\b(a*ha+h[ha]*|o?l+o+l+[ol]*|h*hue+h[hue]*|h*hua+h[hua]*|h*hau+h[hau]*|H*HAU+H[HAU]*|H*HUA+H[HUA]*|H*HUEA+H[HUEA]*|A*HA+H[HA]*)\b/, (msg) ->
    msg.send msg.random photos