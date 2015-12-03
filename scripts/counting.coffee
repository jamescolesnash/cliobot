# Description:
#   #counting
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   #counting - Display a heartwarming image
#
# Author:
#   fraser

images = [
  "https://upload.wikimedia.org/wikipedia/commons/4/44/Eulemur-mongoz_59489762.jpg",
  "http://www.stlzoo.org/files/7713/0798/4204/mongoose_lemur01.jpg",
  "http://www.lambasforlemurs.com/Mongoose_Lemurs_files/shapeimage_1.jpg",
  "http://lemur.duke.edu/wordpress/wp-content/uploads/2014/01/male-and-female-mongoose-lemur.jpg",
  "http://www.adventuresbydaddy.com/wp-content/uploads/2012/04/BG-Mongoose-Lemur-3.jpg.jpg",
  "http://www.animalfactguide.com/wp-content/uploads/2012/04/mongooselemur3-558x402.jpg",
  "http://cdn1.arkive.org/media/7B/7BAAB1F8-999F-4483-93A4-15A5620DD679/Presentation.Large/Male-and-female-mongoose-lemurs.jpg",
]

module.exports = (robot) ->
  regex = /^#counting/i
  robot.hear regex, (msg) ->
    msg.send msg.random images
