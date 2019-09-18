Feature: test rest api


  Scenario: Testing GET method
    Given url 'https://jsonplaceholder.typicode.com/todos/1'
    When method GET
    Then status 200
    And match response.title == 'delectus aut autem'


  Scenario: Testing POST method
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request {"title":"foo", "body":"bar", "userId": 1}
    When method POST
    Then status 201
    And match response.title == 'foo'
    And resp = response