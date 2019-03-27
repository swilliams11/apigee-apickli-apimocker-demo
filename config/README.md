# config

This folder stores the configuration for the demo (developer app, developer, product, etc.). It is dependent on the other proxies being deployed first.  

# Deployment
Deploy the configuration with the following command. However, its best to deploy all the resources with the `deploy.sh` file.  

```
cd ~/Github/apigee-apickli-apimocker-demo/config/org
mvn install -Ptest -Dapigee.username=$APIGEE_UNAME -Dorg=$APIGEE_ORG -Denv=$APIGEE_ORG -Dapigee.password=$APIGEE_PW -Dapigee.config.options=create -Dapigee.config.file=edge.json
```
