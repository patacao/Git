#Formulário de Pesquisa auto.sapo.pt
@car_search
Feature: Pesquisa viatura

  Scenario Outline: : Pesquisar viatura auto.sapo
    Given that i am on auto sapo website
    And i want to search a car of the <marca> brand
    And the model should be <modelo>
    When i click the search button
    Then i should see the results of the search


  Examples:
    | marca | modelo |
    |Honda  |Civic   |
    |Fiat   |Punto   |
    |Citroen|Saxo    |
