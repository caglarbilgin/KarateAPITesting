Feature: test rest api

  Background:
  * url 'https://jsonplaceholder.typicode.com'

  Scenario: Testing GET method
    Given path '/todos/1'
    When method GET
    Then status 200
    And match response.title == 'delectus aut autem'


  Scenario: Testing POST method
    Given path '/posts'
    And request {"title":"foo", "body":"bar", "userId": 1}
    When method POST
    Then status 201
    And match response.title == 'foo'
    And def users = response
    #resp adında bir fonksiyon oluşturuyor. Post işleminden sonra gelen response değerini tutuyor.
    #Bu response'u da diğer bir GET metodunda çağırabiliyoruz(aşağıdaki örnekteki gibi)

    Given path '/todos/' + users.id
    When method GET
    Then status 200
