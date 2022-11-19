pipeline{
 agent any
 parameters{
  
  booleanParam(name: executeTest,defaultValue: true,description: '')
 }
  stages{
    stage("Build"){
      steps{
         echo 'Building stage'
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
