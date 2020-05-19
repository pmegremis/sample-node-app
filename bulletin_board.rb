require 'watir'
browser = Watir::Browser.new :chrome, url: "http://hub:4444/wd/hub"

browser.goto 'http://bulletin:8080'
title = browser.text_field css: 'input[class="form-control"][placeholder="Title"]'
title.set 'Party'

# More commands to fill the form go here

btn = browser.button value: 'Submit'
btn.click

# Just to see the browser
sleep 5

puts browser.title
# => Bulletin Board
browser.quit
