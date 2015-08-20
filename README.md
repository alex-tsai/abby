#A/BBY
A [Framer](http://framerjs.com) module for quantitative usability testing using [Parse](http://parse.com). This module is currently is still very much so in the MVP stages.

#####A/BBY records
* Email of the person completing the usability test
* The time it takes them to complete a task
* An array of the errors they made, if they made any as they completed the task
* Whether or not they successfully complete the task

*Check out the tutorials ([1](https://medium.com/@gk3/using-parse-to-power-up-your-framer-prototypes-88cb87009d00)|[2] (https://medium.com/@gk3/give-your-framer-prototypes-a-better-memory-212b26e0f934)) by [@gk3](https://twitter.com/gk3) to learn about using Parse and Framer together. In my opinion, they're some of the easier to follow tutorials I've seen for Framer.*

##How to use with Framer Studio
1. Create a new Framer project.
2. Download and put `abby.coffee` in the `modules` folder of your project.
3. Replace the placeholder with your own Application ID and Javascript Key for [Parse](http://parse.com) at the top of the `abby.coffee`.
4. Add `<script src="https://www.parsecdn.com/js/parse-1.3.2.min.js"></script>` to `index.html` in the project.
5. Write `abby = require "abby"` at the top of your Framer code and `abby.init()` at the end of your prototype's code.

You can also download the abby.framer project folder to skip some of the steps

## Setting up Parse
1. Create an App if you don't have one already within Framer
2. Make a class named 'Person'
3. Include the following columns to your table
  * time - *String*
  * email - *String*
  * errors - *Array*
  * success - *Boolean*

The data collected from your prototype will be submitted as rows into the same class. The downside of using Parse is that this prototype won't function offline.

## General Use
* The intro screen that collects the email can and probably should be modified depending on your test.
* Make sure to place `abby.init()` at the very end of your prototype code.
* Use `abby.logError('describe the error')` on interactions to log the incorrect interactions they make while trying to complete the task.
* Place `abby.end()` to end the prototype if they didn't complete it correctly and use `abby.success()` to mark when the task is completed.




