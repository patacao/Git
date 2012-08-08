Feature: Pesquisa no google

  Scenario: Efectuar pesquisa no google
    Given i have the browser open
    And i go to the page http://www.google.com
    And i search the word Cucumber
    Then i should see a page with results refering cucumber
