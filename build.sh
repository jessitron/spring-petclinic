mkdir -p target/extracted
java -Djarmode=layertools -jar target/*.jar extract --destination target/extracted
docker build -t demo-otel-operator/petclinic .
