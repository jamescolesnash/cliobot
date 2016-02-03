# Description:
#   Prompts a user to do an exercise based on a random timer.
#
#   Commands:
#     hubot exercise me - Join the exercise lottery!
#
#   Author:
#     achengscode

exercises = [ "pushups", "plank", "sit-ups", "wall sit", "lunges"]
images = [ "https://media.giphy.com/media/87xihBthJ1DkA/giphy.gif",
           "http://i1015.photobucket.com/albums/af273/Chapa37/gif/celebrity-gifs-brad-pitt-workout.gif",
           "https://media.giphy.com/media/jc1Fu8DXTV184/giphy.gif",
           "https://media.giphy.com/media/3o85xGt3BKRhLLGG7C/giphy.gif",
           "http://cdn.ebaumsworld.com/mediaFiles/picture/31430/81941941.gif",
           "http://cdn.ebaumsworld.com/mediaFiles/picture/31430/81941945.gif",
           "https://media.giphy.com/media/eWzaKArTVxk9q/giphy.gif",
           "https://media0.giphy.com/media/l3nWkgzQWq0bXCqTC/200.gif",
           "https://media1.giphy.com/media/61BfgeZcvfh6g/200.gif",
           "https://media1.giphy.com/media/116S6GJEkPw8YE/200.gif",
           "https://media0.giphy.com/media/wcY8khZDRnFss/200.gif",
           "https://media0.giphy.com/media/g80F2NcV1b13G/200.gif",
           "http://45.media.tumblr.com/bd0b35e9486e1092a836192ad8b3261b/tumblr_n37y2eaYLw1ry1rm7o8_400.gif",
           "https://media.giphy.com/media/10BkwRHKkB1PPi/giphy.gif",
           "https://media.giphy.com/media/53RTxXl37LWYU/giphy.gif",
           "https://45.media.tumblr.com/1716e1f9f2a2fa68a8d0d61b0819b112/tumblr_nix40b3Jg71t55xupo1_500.gif",
           "https://media.giphy.com/media/2OMHmoFMiJjfq/giphy.gif",
           "https://media3.giphy.com/media/BvsKJXGzqfNPq/200.gif"
]

module.exports = (robot) ->
  robot.respond /exercise me/i, (msg) ->
    exercise = msg.random exercises

    upper_limit = switch exercise
      when "pushups", "sit-ups", "lunges" then 30
      when "plank"     then 90
      when "wall sit" then 60

    lower_limit = switch exercise
      when "pushups", "sit-ups", "lunges" then 10
      when "plank", "wall sit" then 60

    repetitions = Math.floor Math.random() * (upper_limit - lower_limit) + lower_limit

    response = switch exercise 
      when "pushups", "sit-ups", "lunges" then "give me " + repetitions + " " + exercise
      when "plank", "wall sit" then "give me " + repetitions + " seconds of " + exercise

    msg.reply response
    msg.send msg.random images 
