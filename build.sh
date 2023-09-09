# sadly this does not work, it runs the integration tests
./mvnw package -Dskip.it=true

mkdir -p target/extracted
java -jar -Djarmode=layertools target/*.jar extract --destination target/extracted
docker build -t demo-otel-operator/petclinic .
