# This is for the Get calendar view of events V3. This changes the time that is being pulled to only MST of the current day.

addHours(startOfDay(utcNow()), 8)
addHours(startOfDay(addDays(utcNow(), 2)), -17)

# Apply to each Post Message V2 for slack. This is the message that is sent per event that is pulled.

if(equals(items('Apply_to_each')?['isAllDay'], true),
    'All Day',
    if(equals(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'yyyy-MM-dd'), formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'yyyy-MM-dd')),
        concat(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'), ' - ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US')),
        concat(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'), ' - ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'))
    )
)

# Commented

if(equals(items('Apply_to_each')?['isAllDay'], true),
# This line checks if the value of the 'isAllDay' property in the current item being processed by the loop (as specified by 'items('Apply_to_each')') is equal to true. If it is, the value 'All Day' will be returned. If not, the expression will move on to the next line.
if(equals(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'yyyy-MM-dd'), formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'yyyy-MM-dd')),
# This line checks if the start and end dates of the current item being processed (as specified by 'items('Apply_to_each')?['start']' and 'items('Apply_to_each')?['end']' respectively) are on the same day. To do this, it converts the start and end dates from UTC to the Mountain Standard Time zone (as specified by 'convertTimeZone(parseDateTime(....), 'UTC', 'Mountain Standard Time')') and formats them in the 'yyyy-MM-dd' format. If the formatted start and end dates are equal, the expression will move on to the next line. If not, the expression will move on to the line after that.
concat(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'), ' - ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US')),
# This line formats the start and end dates of the current item being processed as a string in the format 'MMMM d, yyyy h:mm tt - h:mm tt', where 'MMMM' represents the month name, 'd' represents the day of the month, 'yyyy' represents the year, 'h' represents the hour, 'mm' represents the minute, 'tt' represents the AM/PM indicator, and 'en-US' specifies the language of the date and time format. The start and end dates are converted from UTC to the Mountain Standard Time zone (as specified by 'convertTimeZone(parseDateTime(....), 'UTC', 'Mountain Standard Time')') before they are formatted.
concat(formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['start']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'), ' - ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'MMMM d, yyyy', 'en-US'), ' ', formatDateTime(convertTimeZone(parseDateTime(items('Apply_to_each')?['end']), 'UTC', 'Mountain Standard Time'), 'h:mm tt', 'en-US'))
# This line formats the start and end dates of the current item being processed as a string in the format 'MMMM d, yyyy h:mm tt - MMMM d, yyyy h:mm tt', where 'MMMM' represents the month name, 'd' represents the day of the month, 'yyyy' represents the year, 'h' represents