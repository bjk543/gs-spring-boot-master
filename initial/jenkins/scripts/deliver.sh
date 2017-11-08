ps | grep java-fullstack | awk '{print $1}' | xargs kill -9 || true
nohup java -jar ../../target/gs-spring-boot-0.1.0.jar &
