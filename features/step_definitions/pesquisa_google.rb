require "test/unit"
require "rubygems"
gem "selenium-client"
gem "selenium-webdriver"
require "selenium/client"

Given /^i have the browser open$/ do
  @selenium = Selenium::Client::Driver.new \
    :host => "localhost",
    :port => 4444,
    :browser => "*chrome",
    :url => "http://www.google.com/",
    :timeout_in_second => 60
  @selenium.start_new_browser_session

end

And /^i go to the page http:\/\/www\.google\.com$/ do
  @selenium.open("http://www.google.com")
end

And /^i search the word Cucumber$/ do
  @selenium.type "id=gbqfq", "cucumber" #insere texto cucumber

end

Then /^i should see a page with results refering cucumber$/ do
  @selenium.click "id=gbqfb"  #clica botão pesquisar

end