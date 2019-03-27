# Auth

This is the OAuth proxy that generates the access token.

## Deploy the proxy
  1. Make sure you have Maven installed.
  2. Deploy your proxy
    ```
    cd auth
    mvn install -Dapigee.org=$APIGEE_ORG -Dapigee.env=$APIGEE_ENV -Dapigee.username=$APIGEE_UNAME -Dapigee.password=$APIGEE_PW -DskipTests=true
    ```

  3. Test your proxy deployment:
    ```
    mvn install -Dapigee.org=$APIGEE_ORG -Dapigee.env=$APIGEE_ENV -DskipDeployment=true
    ```

# Ask the community

[![alt text](../../../images/apigee-community.png "Apigee Community is a great place to ask questions and find answers about developing API proxies. ")](https://community.apigee.com?via=github)

---

Copyright © 2017 Apigee Corporation

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy
of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

http://docs.apigee.com/api-services/reference/supported-software
