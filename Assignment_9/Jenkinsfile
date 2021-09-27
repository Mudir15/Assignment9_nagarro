pipeline {
  agent any
  stages {

  stage('Maven Installation')
    {
    steps{
        echo "Building the checked out project...";
        bat "mvn clean install";
        }
    }
    stage('Deploy')
    {
      steps{
        echo "Deploying Project";

    }
    }
}
}