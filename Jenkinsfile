pipeline{
 agent any
 tools{
 maven 'Maven-3.6.1'
 }

 parameters {
  choice choices: ['1.1.0', '1.2.0', '1.3.0'], name: 'VERSION'
  booleanParam defaultValue: true, name: 'executeTest'
         }

  stages{
    stage("Build"){
      steps{
         echo 'Building stage'
        sh 'mvn clean install'
      }
     }
     stage("Test"){
      when{
       expression{
       params.executeTest
       }
      }
      steps{
          echo 'Testing stage'
      }
     }
     stage("Deploy"){
      steps{
          echo 'Deploying stage'
       echo "version ${params.VERSION}"
      }
     }
  }
  
}
