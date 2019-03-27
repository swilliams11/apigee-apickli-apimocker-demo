Feature: As a developer I want to be able to authenticate my application so that I can access secure APIs.

    Scenario: I send a valid client ID and secret, then I should receive a valid access token.

      Given I set body to grant_type=client_credentials
      And I set Content-Type header to application/x-www-form-urlencoded
      And I set Authorization header to Basic `APIGEE_API_CREDENTIALS`
      When I POST to /developer-experience-auth/token
      Then response code should be 200
      And response body should be valid json
      And response header Content-Type should be application/json

    Scenario: I send an invalid client ID and secret, then I should receive error message.

      Given I set body to grant_type=client_credentials
      And I set Content-Type header to application/x-www-form-urlencoded
      And I set Authorization header to Basic eHl6Onp5YQ==
      When I POST to /developer-experience-auth/token
      Then response code should be 401
      And response body should be valid json
