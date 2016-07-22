# Description:
#   A collection of responses that ClioBot can use to add emphasis to a
#   conversation. If a given regex matches something that ClioBot hears,
#   then it will respond with one random element selected out of the
#   associated array of responses.
#
# Author:
#   #counting (fraser)
#   disappointed! (rbroemeling)
#   wcpgw? (fimmtiu)
emphasizers = [
  {
    hear: /(^|\W)(wcpgw|what could possibl[ai]?y go wrong)(\W|$)/i,
    responses: [
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
      "http://p.fod4.com/p/media/b06153cff7/v2Q12ngeR6uHohjdAXxs_Michael%20Bay%20Baseball.gif",
    ]
  },
  {
    hear: /(^|\W)disappointed(\W|$)/i,
    responses: [
      "http://i.imgur.com/ldOXJ5E.gif"
    ]
  },
  {
    hear: /(^|\W)#counting(\W|$)/i,
    responses: [
      "https://upload.wikimedia.org/wikipedia/commons/4/44/Eulemur-mongoz_59489762.jpg",
      "http://www.stlzoo.org/files/7713/0798/4204/mongoose_lemur01.jpg",
      "http://www.lambasforlemurs.com/Mongoose_Lemurs_files/shapeimage_1.jpg",
      "http://lemur.duke.edu/wordpress/wp-content/uploads/2014/01/male-and-female-mongoose-lemur.jpg",
      "http://www.adventuresbydaddy.com/wp-content/uploads/2012/04/BG-Mongoose-Lemur-3.jpg.jpg",
      "http://www.animalfactguide.com/wp-content/uploads/2012/04/mongooselemur3-558x402.jpg",
      "http://cdn1.arkive.org/media/7B/7BAAB1F8-999F-4483-93A4-15A5620DD679/Presentation.Large/Male-and-female-mongoose-lemurs.jpg",
    ]
  },
  {
    hear: /(^|\W)(roger|rgr) (roger|rgr)(\W|$)/i,
    responses: [
      "https://media.giphy.com/media/xT9DPr4VjeCgeiLoMo/giphy.gif"
    ]
  },
  {
    hear: /^y+u+p+$/i,
    responses: [
      "http://s2.quickmeme.com/img/f0/f0b7609cb1bb382f12d43e048562dd94544005d1ec47af6990e08661f1c15c19.jpg",
      "https://cdn.meme.am/instances/47930163.jpg",
      "http://i.imgur.com/eNHBJQ1.jpg"
    ]
  }
]

module.exports = (robot) ->
  emphasizers.forEach (emphasizer) ->
    if emphasizer.hasOwnProperty('hear')
      robot.hear emphasizer.hear, (msg) ->
        msg.send msg.random emphasizer.responses
    else if emphasizer.hasOwnProperty('respond')
      robot.respond emphasizer.respond, (msg) ->
        msg.send msg.random emphasizer.responses
    else
      robot.logger.warn "emphasis.coffee - skipping emphasizer that has neither '.hear' nor '.respond' properties"
