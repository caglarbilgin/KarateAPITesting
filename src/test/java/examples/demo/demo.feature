Feature: test rest api


  Scenario: Testing GET method
    Given url 'https://jsonplaceholder.typicode.com/todos/1'
    When method GET
    Then status 200
    And match response.title == 'delectus aut autem'