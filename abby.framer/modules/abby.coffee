# APPLICATION ID, JAVASCRIPT KEY
Parse.initialize("APPLICATION ID","JAVASCRIPT KEY")

# Setup for adding rows to Parse
Person = Parse.Object.extend('Person')
newPerson = new Person()

###
Set up layers that ask for the email and triggers the start for the timer
###

# multiplier is for different screen densities, iphone 6+ at 3x needs different dimetions than something at 1x
multiplier = 1
if Framer.Device.deviceType .indexOf('plus') >= 0 or Framer.Device.deviceType.indexOf('nexus-5') >= 0
	multiplier = 3
else if Framer.Device.deviceType.indexOf('iphone') >= 0 or Framer.Device.deviceType.indexOf('ipad') >= 0 or  Framer.Device.deviceType.indexOf('nexus-9') >= 0 or  Framer.Device.deviceType.indexOf('applewatch') >= 0
	multiplier = 2

bg = new BackgroundLayer backgroundColor:"#f3f3f3"
email = new Layer superLayer: bg, width: 302 * multiplier, midX: Screen.width/2, height: 42 * multiplier, borderWidth: 1 * multiplier, borderRadius: 2 * multiplier, borderColor: "#d3d3d3", backgroundColor:"#FFFFFF", y:Screen.height*0.4
email.html = "<textarea id='email' placeholder='Email Address' style='height:" + email.height + "px;width: " + email.width + "px;font-size:" + 16 * multiplier + "px;padding: " + 12 * multiplier + "px;'></textarea>"
button = new Layer superLayer: bg, width: 150 * multiplier, x: email.x, height: 40 * multiplier, y: email.maxY + 20 * multiplier, backgroundColor:"#727272", borderRadius: 2* multiplier
button.html = "<div style='text-align:center;height:" + button.height + "px;width: " + button.width + "px;font-size:" + 16 * multiplier + "px;padding-top: " + (16 * multiplier - 8) + "px;'>Start</div>"
button.on Events.TouchStart, ->
	button.backgroundColor = "#333333"
button.on Events.TouchEnd, ->
	button.backgroundColor = "#727272"
	submit()

#Overrides enter key to submit not adding an extra line and to submit instead
email.querySelector('textarea').onkeydown = (e)->
		if e.keyCode == 13
			e.preventDefault()
			submit()
#Checks the validity of the email if valid, start destroy intro layers and start the timer.
submit =->
	re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
	if !re.test(email.querySelector('textarea').value)
		email.borderColor = "#FFAABB"
	else
		newPerson.set 'email', email.querySelector('textarea').value
		bg.animate
			properties:
				opacity: 0
			time: 0.5
		Utils.delay 0.5, ->
			bg.destroy()
			start()
#Formfield click feedback
email.querySelector('textarea').onfocus =->
	email.borderColor = "#727272"

email.querySelector('textarea').onblur =->
	email.borderColor = "#d3d3d3"


###
	Classes and functions for collecting quantitative usability data
###

# Helper class for timing the duration
class Duration
	start: new Date().getTime()
	end: ->
		time = new Date(new Date().getTime() - @start)
		return time.getMinutes() + ":" + time.getSeconds() + "." + Math.round(time.getMilliseconds()/100)
timer = new Duration()

# Starts the timer
start = ->
	timer.start = new Date().getTime()

# Returns the time in minutes:seconds from when start is called to when this function is called.
stop = ->
	return timer.end()

#Logs or any action that they make that is incorrect. It takes an error message as the parameter
errors = []
exports.logError = (error)->
	errors.push(error)


# Defaults to fail
success = false

# This is in case they do not accomplish the task (I would trigger this on a timer or possibly on shake)
exports.end = ->
	newPerson.set 'success', success
	newPerson.set 'time', stop()
	newPerson.set 'errors', errors
	newPerson.save
		success: (person) ->
			print "Thank You!"

# On successful completion of task
exports.success = ->
	success = true
	exports.end()

#Call this in the beginning to bring this over the other layers in the prototype
exports.init = ->
	bg.bringToFront()
