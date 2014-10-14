# Description:
#   What could possiblay go wrong?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wcpgw? - Display a heartwarming image
#
# Author:
#   fimmtiu

images = [
  "http://www.he-manreviewed.com/wp-content/uploads/2013/06/201-5-Cant-Touch-This-Gif.gif",
  "http://big.assets.huffingtonpost.com/explosion570.gif",
  "http://media.giphy.com/media/RWwzyQLBeLJbq/giphy.gif",
  "http://www.shockmansion.com/wp-content/myimages/2014/09/tumblr_nbfvgf3NDs1ta83ebo2_400.gif",
  "http://cdn.gifbay.com/2014/01/chimney_demolition_fail-109155.gif",
  "http://i.imgur.com/0RXtO.gif",
  "http://www.lolzgif.com/wp-content/uploads/2012/10/forklift-warehouse-accident.gif",
  "http://stream1.gifsoup.com/view3/1470963/buster-keaton-wall-fall-o.gif",
  "http://www.amusingtime.com/images/07/too-heave-for-a-horse.jpg",
  "http://www.searchrobot.net/aircraft_luggage_accident.jpg",
  "http://2.bp.blogspot.com/-Eqq5rV3bouI/UlcBXb25w6I/AAAAAAAAD88/HECrbXKe8YM/s1600/Gif+5+(tumblr_m9kjpsc1WC1qk4y43o1_r14_500).gif",
  "http://stream1.gifsoup.com/view1/1500114/engineering-fail-o.gif",
  "http://www.workflowmax.com/hs-fs/hub/325051/file-1237019792-jpg/blog-attachments/tumblr_l83k83w4sI1qdsapuo1_500.jpg",
]

module.exports = (robot) ->
  regex = /^(wcpgw([?!.]|$)|what could possibla?y go wrong/i
  robot.hear regex, (msg) ->
    msg.send msg.random images
