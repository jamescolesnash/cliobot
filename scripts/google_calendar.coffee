# Description:
#   google calendar for hubot
# Commands:
#   hubot calendar - list up today event
#   hubot calendar (today|tomorrow) - list up today or tomorrow event

requestWithJWT = require('google-oauth-jwt').requestWithJWT()
moment         = require('moment-timezone')
_              = require('underscore')

module.exports = (robot) ->
  robot.respond /calendar/i, (msg) ->
    try
      getCalendarEvents new Date(), (str) ->
        msg.send str
    catch e
      msg.send "exception: #{e}"

  request = (opt, onSuccess, onError) ->
    params =
      jwt:
        email: process.env.HUBOT_GOOGLE_CALENDAR_EMAIL
        keyFile: process.env.HUBOT_GOOGLE_CALENDAR_KEYFILE
        scopes: ['https://www.googleapis.com/auth/calendar.readonly']
    _.extend(params, opt)

    robot.logger.debug(params)

    requestWithJWT(params, (err, res, body) ->
      if err
        onError(err)
      else
        if res.statusCode != 200
          onError "status code is #{res.statusCode}"
          return
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
    strs.join " "

  getCalendarEvents = (baseDate, str) ->
    request(
      { url: 'https://www.googleapis.com/calendar/v3/users/me/calendarList' }
      (calendarListResponse) ->
        timeMin = new Date(baseDate.getTime())
        #Show all items for the day
        timeMin.setHours 0, 0, 0
        timeMax = new Date(baseDate.getTime())
        timeMax.setHours 23, 59, 59

        if calendarListResponse.items.length == 0
            console.log "No calendar items found"

        for i, calendarItem of calendarListResponse.items
          request(
            {
              url: "https://www.googleapis.com/calendar/v3/calendars/#{calendarItem.id}/events"
              qs:
                timeMin: moment(timeMin).tz(calendarItem.timeZone).format()
                timeMax: moment(timeMax).tz(calendarItem.timeZone).format()
                orderBy: 'startTime'
                singleEvents: true
                timeZone: calendarItem.timeZone
            }
            (calendarEventsResponse) ->
              strs = [calendarItem.id]
              for i, eventItem of calendarEventsResponse.items
                strs.push formatEvent(eventItem)
                request(
                  {
                    url: "https://www.googleapis.com/calendar/v3/calendars/#{calendarItem.id}/events/#{eventItem.id}"
                  }
                  (calendarEventDetailsResponse) ->
                    str calendarEventDetailsResponse.description
                )

              str strs.join("\n")
          )
    )
