require 'watir'
browser = Watir::Browser.new :chrome, url: "http://selenium-hub:4444/wd/hub"

browser.goto 'http://bulletin:8080'
search_field = browser.text_field name: 'q'
search_field.set 'Hello World!'
browser.send_keys :enter

# Just to see the browser
sleep 5

puts browser.title
# => 'Hello World! - Google Search'
browser.quit
