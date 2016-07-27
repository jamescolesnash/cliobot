# Description:
#   google calendar for cliobot
# Commands:
#   cliobot daily events {calendar id} - list up today events
#   cliobot next event {calendar id} - list the next event
#   cliobot list calendars
# Author:
#   james.coles-nash
# Original code was taken from:
#   https://github.com/soh335/hubot-google-calendar

requestWithJWT = require('google-oauth-jwt').requestWithJWT()
moment         = require('moment-timezone')
_              = require('underscore')

module.exports = (robot) ->
  robot.respond /list calendars/i, (msg) ->
    getCalendarList (str) ->
      msg.send "Calendars cliobot has access to:"
      msg.send str.join("\n")

  robot.respond /daily events for (.*)/i, (msg) ->
    getCalendarEvents new Date(), 0, msg.match[1], (str) ->
      msg.send str.join("\n")

  robot.respond /next event for (.*)/i, (msg) ->
    getCalendarEvents new Date(), null, msg.match[1], (str) ->
      msg.send str.join("\n")

  request = (opt, onSuccess, onError) ->
    params =
      jwt:
        email: process.env.HUBOT_GOOGLE_CALENDAR_EMAIL
        keyFile: process.env.HUBOT_GOOGLE_CALENDAR_KEYFILE
        scopes: ['https://www.googleapis.com/auth/calendar.readonly']
    _.extend(params, opt)

    requestWithJWT(params, (err, res, body) ->
      if err
        onError(err)
      else
        if res.statusCode != 200
          onError("status code is #{res.statusCode}")
        onSuccess JSON.parse(body)
    )

  formatEvent = (event) ->
    justTime = /\d{2}:\d{2}:\d{2}/g
    strs = []
    if event.start
      if event.start.date
        strs.push event.start.date
      else if event.start.dateTime
        strs.push event.start.dateTime.match justTime

    if event.end
      strs.push "~"
      if event.end.date
        strs.push event.end.date
      else if event.end.dateTime
        strs.push event.end.dateTime.match justTime

    strs.push event.summary
    strs.push "\n"
    strs.push "\t#{event.htmlLink}"
    strs.join " "

  getCalendarList = (str) ->
    onError = (err) ->
      str ["Failed to load calendar list: #{err}"]
    request(
      { url: "https://www.googleapis.com/calendar/v3/users/me/calendarList" }
      (calendarListResponse) ->
        strs = []
        for i, calendarItem of calendarListResponse.items
          strs.push calendarItem.id
        str strs
      onError
    )

  getCalendarEvents = (baseDate, startTime, calendarId, str) ->
    onError = (err) ->
      str ["Failed to load calendar events: #{err}"]
    request(
      { url: "https://www.googleapis.com/calendar/v3/calendars/#{calendarId}" }
      (calendarResponse) ->
        timeMin = new Date(baseDate.getTime())
        timeMin.setHours startTime if startTime?

        timeMax = new Date(baseDate.getTime())
        timeMax.setHours 23, 59, 59

        request(
          {
            url:
              "https://www.googleapis.com/calendar/v3/calendars/#{calendarResponse.id}/events"
            qs:
              timeMin: moment(timeMin).tz(calendarResponse.timeZone).format()
              timeMax: moment(timeMax).tz(calendarResponse.timeZone).format()
              orderBy: 'startTime'
              singleEvents: true
              timeZone: calendarResponse.timeZone
          }
          (calendarEventsResponse) ->
            strs = []
            for i, eventItem of calendarEventsResponse.items
              strs.push formatEvent(eventItem)
            str strs
          onError
        )
      onError
    )
