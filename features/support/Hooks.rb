#require "selenium/rspec/rspec_extensions"

Before ('@navigate') do
  @driver = Selenium::WebDriver.for :firefox #Browser :firefox
  @driver.get "http://www.sapo.pt" #navegar para página

end

Before ('@car_search') do
 # @driver = Selenium::WebDriver.for :ie #Browser :firefox


end

After ('@navigate') do
  #@driver.quit()
end
