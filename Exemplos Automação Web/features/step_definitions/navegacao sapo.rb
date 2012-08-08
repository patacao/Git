# encoding: utf-8
require "test/unit"
require "rubygems"
gem "selenium-client"
gem "selenium-webdriver"
require "selenium/client"
require "selenium-webdriver"


Given /^that i am on sapo website$/ do
#--------Utilizando o Selenium RC---------------
  #@selenium = Selenium::Client::Driver.new \
  #:host => "localhost",
  #:port => 4444,
  #:browser => "*chrome",
  #:url => "http://www.google.com/",
  #:timeout_in_second => 60
  #@selenium.start_new_browser_session
  #@selenium.open("http://www.sapo.pt")

#---------Utilizando o Selenium Webdriver-------


end

When /^i want to navigate to the page (.*)$/ do |page|
#--------Utilizando o Selenium RC---------------
  #if page == "Casas"
  #  @selenium.click "//div[@id='services']/nav/div/ul/li[4]/a/span"
  #elsif page == "Carros"
  #  @selenium.click "//div[@id='services']/nav/div/ul/li[3]/a/span"
  #elsif page == "Emprego"
  #  @selenium.click "//div[@id='services']/nav/div/ul/li[5]/a/span"
  #end
  #@selenium.wait_for_page_to_load "30000"
  #@selenium.click "css=span"

#---------Utilizando o Selenium Webdriver-------
  if page == "Casas"
    @driver.find_element(:xpath, "//div[@id='services']/nav/div/ul/li[5]/a/span").click  #click no link de menu através do xpath
  elsif page == "Carros"
    @driver.find_element(:xpath, "//div[@id='services']/nav/div/ul/li[4]/a/span").click
  elsif page == "Emprego"
    @driver.find_element(:xpath, "//div[@id='services']/nav/div/ul/li[6]/a/span").click
  end
end


Then /^i should see the content of the page (.*)$/ do |page|
  #Capturar screenshot
  #@selenium.capture_screenshot("c:\\test.png");

  if page == "Casas"
    @driver.find_element(:xpath, ("//*[contains(.,'Pesquisar Apartamentos')]")); #Pesquisa o Texto de validação
    #Imprimir para um ficheiro
    File.open("c:\\log.txt", 'a'){|f| f.write("Casa Sapo - OK")}  # 'w' - escreve de novo | 'a' - faz o append

  elsif page == "Carros"
    @driver.find_element(:xpath, ("//*[contains(.,'Carros Usados')]"));
    #Imprimir para um ficheiro

  elsif page == "Emprego"
    @driver.find_element(:xpath, ("//*[contains(.,'Encontre o emprego certo')]"));
    #Imprimir para um ficheiro
  end
end

When /^view a specific image$/ do
  #Click na imagem de Anúncio (Carros)
  element = @driver.find_element(:id => "ctl00_ContentPlaceHolder1_vehicleOfTheDay_image")
  #Verifica se determinada imagem existe
  File.open("c:\\log.txt", 'a'){|f| f.write(element.displayed?)}         #para terminar

end

#------------- Scenário 2 - Navegar submenu -----------------

When /^i want to navigate to the subpage (.*)$/ do |subpage|
  if subpage == "Desporto"
    @driver.find_element(:xpath, "//div[@id='tabs_noticias']/nav/ul/li[2]/a/span").click  #click no link de menu através do xpath
  elsif subpage == "Sociedade"
    @driver.find_element(:xpath, "//div[@id='tabs_noticias']/nav/ul/li[5]/a/span").click
  end
end

Then /^i should see the content of the subpage (.*)$/ do |subpage|
  if subpage == "Desporto"
    @driver.find_element(:xpath, ("//*[contains(.,'Jogos Olímpicos')]"));
  elsif subpage == "Sociedade"
    @driver.find_element(:xpath, ("//*[contains(.,'Visão Verde')]"));
  end
end