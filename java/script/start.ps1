. ($PSScriptRoot + "\common.ps1")

RunSetupIfNeeded

mvn package -D maven.test.skip

java -jar .\target\pairing-test-1.0-SNAPSHOT.jar