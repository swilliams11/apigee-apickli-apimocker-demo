#ORG=$1
#ENV=$2
#UNAME=$3
#PW=$4

cd auth
echo "Deploying the auth proxy."
mvn install -Dapigee.org=$1 -Dapigee.env=$2 -Dapigee.username=$3 -Dapigee.password=$4 -DskipTests=true

cd ../mockbackend
echo "Deploying the mockbackend."
mvn install -Dapigee.org=$1 -Dapigee.env=$2 -Dapigee.username=$3 -Dapigee.password=$4 -DskipTests=true

cd ../signup
echo "Deploying the signup proxy."
mvn install -Dapigee.org=$1 -Dapigee.env=$2 -Dapigee.username=$3 -Dapigee.password=$4 -DskipTests=true

cd ../config/org
echo "Deploying the Apigee configuration data."
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dapigee.username=$3 -Dapigee.password=$4 -Dapigee.config.options=create -Dapigee.config.file=edge.json
