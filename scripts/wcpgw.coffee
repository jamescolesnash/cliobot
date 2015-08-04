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
  "http://funkplanet.com/wcpgw/he_man_airplane.gif",
  "http://funkplanet.com/wcpgw/explosion.gif",
  "http://funkplanet.com/wcpgw/palm_trees_explosion.gif",
  "http://funkplanet.com/wcpgw/exploding_skateboarders.gif",
  "http://funkplanet.com/wcpgw/chimney_demolition_fail.gif",
  "http://funkplanet.com/wcpgw/sad_building.gif",
  "http://funkplanet.com/wcpgw/forklift_warehouse_accident.gif",
  "http://funkplanet.com/wcpgw/buster_keaton_wall_fall.gif",
  "http://funkplanet.com/wcpgw/horse_counterweight.jpg",
  "http://funkplanet.com/wcpgw/aircraft_luggage_accident.jpg",
  "http://funkplanet.com/wcpgw/walking_the_plank.gif",
  "http://funkplanet.com/wcpgw/stadium_roof.gif",
  "http://funkplanet.com/wcpgw/highway_fail.jpg",
  "http://funkplanet.com/wcpgw/capitol_explosion.gif",
  "http://funkplanet.com/wcpgw/mushroom_cloud.gif",
  "http://funkplanet.com/wcpgw/forklift_fail.gif",
  "http://funkplanet.com/wcpgw/shopping_carts.gif",
  "http://funkplanet.com/wcpgw/dog_stairs.gif",
  "http://i.imgur.com/rFmnfu2.gif",
]

module.exports = (robot) ->
  regex = /^(wcpgw([?!.]|$)|what could possibla?y go wrong)/i
  robot.hear regex, (msg) ->
    msg.send msg.random images
