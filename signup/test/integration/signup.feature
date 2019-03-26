Feature: As a client app I would like to register a user and send an email to the user upon successful registration.

    Scenario: I send a valid client ID and secret I should receive a valid access token.

      Given I set body to grant_type=client_credentials
      And I set Content-Type header to application/x-www-form-urlencoded
      And I set Authorization header to Basic BASE64ENCODE_YOUR_APIKEY_SECRET
      When I POST to /developer-experience-auth/token
      Then I store the value of body path $.access_token as token in global scope

    Scenario: I send an invalid access token then the request should fail.

      Given I set body to {"username": "sampleuser1", "state": "IL", "email": "sampleuser1@email.com"}
      And I set Content-Type header to application/json
      And I set Authorization header to Bearer
      When I POST to /users/registration
      Then response code should be 401
      And response body should be valid json
      And response body path $.fault.faultstring should be Invalid access token
      And response header Content-Type should be application/json

    Scenario: I send a valid request to register a user and the user should be registered successfully.

        Given I set body to {"username": "jayhawk", "state": "KY", "email": "sampleuser1@email.com" }
        And I set Authorization header to Bearer `token`
        And I set Target-Path header to /users/registration
        And I set Content-Type header to application/json
        When I POST to /users/registration
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be User registered successfully!
        And response header Content-Type should be application/json

    Scenario: User registration fails

        Given I set body to { "username": "fail", "state": "KY" }
        And I set Authorization header to Bearer `token`
        And I set Content-Type header to application/json
        And I set Target-Path header to /users/registration
        When I POST to /users/registration
        Then response code should be 400
        And response body should be valid json
        And response body path $.fault.faultstring should be User registration failed
        And response header Content-Type should be application/json

    Scenario: I send a valid request, but the server is slow to respond - 5 second timeout;

        Given I set body to {"username": "jayhawk", "state": "KY"}
        And I set Authorization header to Bearer `token`
        And I set Target-Path header to /users/registration/slow
        And I set Content-Type header to application/json
        When I POST to /users/registration
        Then response code should be 500
        And response body should be valid json
        And response body path $.fault.faultstring should be User registration failed
        And response header Content-Type should be application/json

    Scenario: I send a valid request but the target server is down - 30 second timeout

        Given I set body to {"username": "jayhawk", "state": "KY"}
        And I set Authorization header to Bearer `token`
        And I set Target-Path header to /users/registration/down
        And I set Content-Type header to application/json
        When I POST to /users/registration
        Then response code should be 500
        And response body should be valid json
        And response body path $.fault.faultstring should be User registration failed
        And response header Content-Type should be application/json

    Scenario: I can register a new user successfully and an email is sent successfully.

        Given I set body to {"username": "jayhawk", "state": "KY", "email":"user1@email.com"}
        And I set Authorization header to Bearer `token`
        And I set Target-Path header to /users/registration
        And I set Target-Path-Email header to /email/sampleuser
        And I set Content-Type header to application/json
        When I POST to /users/registration
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be User registered successfully and you should receive a welcome email in few minutes!
        And response header Content-Type should be application/json

    Scenario: I send a valid request but the service fails to send an email, then the user is registered and the request succeeds.

        Given I set body to {"username": "jayhawk", "state": "KY", "email":"user1@email.com"}
        And I set Content-Type header to application/json
        And I set Authorization header to Bearer `token`
        And I set Target-Path header to /users/registration
        And I set Target-Path-Email header to /email/fail/
        When I POST to /users/registration
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be User registered successfully!
        And response header Content-Type should be application/json

    Scenario: I send a valid request but the email service is down, then the user is registered and the request succeeds.

      Given I set body to {"username": "jayhawk", "state": "KY", "email":"user1@email.com"}
      And I set Content-Type header to application/json
      And I set Authorization header to Bearer `token`
      And I set Target-Path header to /users/registration
      And I set Target-Path-Email header to /email/sampleuser/down
      When I POST to /users/registration
      Then response code should be 200
      And response body should be valid json
      And response body path $.msg should be User registered successfully!
      And response header Content-Type should be application/json
