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
   
   stage("Doker Image Build"){
    steps{
     script{
      sh 'docker build -t yasasbulumulla/spring-boot-test1:$BUILD_NUMBER .'
     
     }
    }
   }
    
    stage("Pust to Dokerhub"){
     steps{
      script{
      withCredentials([string(credentialsId: 'Docker_HUB_Credentials', variable: 'Docker_Hub_Cred')]) {
       sh 'docker login -u yasasbulumulla -p ${Docker_Hub_Cred}'
       
       }
       sh 'docker push yasasbulumulla/spring-boot-test1:$BUILD_NUMBER'
      }
     }
    }
    
    stage('k8s push') {
     steps{
       script{
     sshagent(['k8s-privatekey']) {
    
      sh "chmod 777 changeTag.sh"
      sh "./changeTag.sh $BUILD_NUMBER"
     sh "scp -o StrictHostKeyChecking=no node-app-pod.yml root@192.168.56.112:/root"
     sh "scp -o StrictHostKeyChecking=no Ingress.yaml root@192.168.56.112:/root"
    try{
        sh "ssh root@192.168.56.112 kubectl apply -f node-app-pod.yml"

        }catch(error)
            {
            sh "ssh root@192.168.56.112 kubectl create -f node-app-pod.yml"
        }
      }
     }
     }
}
    
   
  }
  
}
