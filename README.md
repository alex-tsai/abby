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
5. Write `abby = require "abby"` at the top of your Framer code and `abby.init()` after the rest of your code.

You can also download the abby.framer project folder to skip some of the steps

##Parse set up



