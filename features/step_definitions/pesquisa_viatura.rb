# encoding: utf-8
require "test/unit"
require "rubygems"
gem "selenium-client"
gem "selenium-webdriver"
require "selenium/client"
require "selenium-webdriver"

#Variáveis de suporte
$i = 0;

Given /^that i am on auto sapo website$/ do
  @driver.get "http://auto.sapo.pt" #navegar para página
end

When /^i want to search a car of the (.*) brand$/ do |marca|
  #if marca = "Honda"
  Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "ctl00_ContentPlaceHolder1_ctl00_ddBrand")).select_by(:text, marca)
  #elsif marca = "Fiat"
   # carro = @driver.find_element(:id, "ctl00_ContentPlaceHolder1_ctl00_ddBrand").select_by(:text, "Fiat")
  #elsif marca = "Citroen"
   # carro = @driver.find_element(:id, "ctl00_ContentPlaceHolder1_ctl00_ddBrand").select_by(:text, "Citroen")
end

When /^the model should be (.*)$/ do |modelo|
  Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "ctl00_ContentPlaceHolder1_ctl00_ddModel")).select_by(:text, modelo)
end

When /^i click the search button$/ do
  @driver.find_element(:id, "ctl00_ContentPlaceHolder1_ctl00_btSearch").click
  #Capture ScreenShot
   $i = $i + 1;
  @driver.save_screenshot("c:\\test#$i.png");
end

Then /^i should see the results of the search$/ do
  @driver.find_element(:xpath, ("//*[contains(.,'Encontrados')]"));
end