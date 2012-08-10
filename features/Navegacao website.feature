@navigate
Feature: Navegação website

  Scenario Outline: : Navegar menu principal sapo
    Given that i am on sapo website
    And i want to navigate to the page <page>
    Then i should see the content of the page <page>
    And view a specific image

   Examples:
   | page  |
   |Carros |
   |Casas  |
   |Emprego|

  Scenario Outline: Navegar sub menu sapo
    Given that i am on sapo website
    And i want to navigate to the subpage <subpage>
    Then i should see the content of the subpage <subpage>

  Examples:
    | subpage |
    |Desporto |
    |Sociedade|
