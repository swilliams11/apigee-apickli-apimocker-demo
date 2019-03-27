Feature: As a developer I would like to mock my backend server and test different failure scenarios.

    Scenario: I can register a new user successfully

        Given I set body to {"username": "jayhawk", "state": "KY"}
        And I set Content-Type header to application/json
        When I POST to /users/registration
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be user registered successfully
        And response header Content-Type should be application/json

    Scenario: User registration fails

        Given I set body to { "username": "fail", "state": "KY" }
        And I set Content-Type header to application/json
        When I POST to /users/registration/
        Then response code should be 400
        And response body should be valid json
        And response body path $.msg should be User registration failed
        And response header Content-Type should be application/json

    Scenario: I can register a new user successfully - delayed

        Given I set body to {"username": "jayhawk", "state": "KY"}
        And I set Content-Type header to application/json
        When I POST to /users/registration/slow
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be user registered successfully
        And response header Content-Type should be application/json

    Scenario: I can register a new user successfully - 30 timeout

        Given I set body to {"username": "jayhawk", "state": "KY"}
        When I POST to /users/registration/down
        And I set Content-Type header to application/json
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be user registered successfully
        And response header Content-Type should be application/json

    Scenario: Email sent successfully

        Given I set body to {"msg": "Congratulations! You have been registered in our system!"}
        And I set Content-Type header to application/json
        When I POST to /email/sampleuser
        Then response code should be 200
        And response body should be valid json
        And response body path $.msg should be email sent successfully
        And response header Content-Type should be application/json

    Scenario: Email failed to send

        Given I set body to {"msg": "Congratulations! You have been registered in our system!"}
        And I set Content-Type header to application/json
        When I POST to /email/fail
        Then response code should be 400
        And response body should be valid json
        And response body path $.msg should be Email failed to send.
        And response header Content-Type should be application/json

    Scenario: Email service is down

        Given I set body to {"msg": "Congratulations! You have been registered in our system!"}
        And I set Content-Type header to application/json
        When I POST to /email/sampleuser/down
        Then response code should be 503
        And response body should be valid json
        And response body path $.msg should be Service unavailable.
        And response header Content-Type should be application/json
