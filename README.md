# apigee-apickli-apimocker-demo

This repository demo's apickli, Apigee Maven deployment plugin, Apigee Maven config plugin and Apigee Hosted Targets.


## Deployment

1. Clone this repository.
```
git clone https://github.com/swilliams11/apigee-apickli-apimocker-demo.git
```

2. CD into the directory where you cloned the repository and deploy all the proxies.

```
cd apigee-apickli-apimocker-demo

```

3. Deploy all services and configuration data.  This deploy script will not run any tests.

```
./deploy.sh $APIGEE_ORG $APIGEE_ENV $APIGEE_UNAME $APIGEE_PW
```

e.g.
```
./deploy.sh demo-org test username@gmail.com SeCret531
```


## Other information

* Deploy the configuration to Apigee (developer, app and API product).
```
cd ~/Github/apigee-apickli-apimocker-demo/config/org
mvn install -Ptest -Dapigee.username=$APIGEE_UNAME -Dorg=$APIGEE_ORG -Denv=$APIGEE_ORG -Dapigee.password=$APIGEE_PW -Dapigee.config.options=create -Dapigee.config.file=edge.json
```

* Skip tests and deploy proxy only
```
 mvn install -Dapigee.username=$APIGEE_UNAME -Dapigee.org=$APIGEE_ORG -Dapigee.env=$APIGEE_ENV -Dapigee.password=$APIGEE_PW -DskipTests=true
```

* Run tests only
```
mvn install -Dapigee.org=$APIGEE_ORG -Dapigee.env=$APIGEE_ENV -DskipDeployment=true
```
