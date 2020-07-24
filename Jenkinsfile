pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Induccion'
  }

  //Opciones específicas de Pipeline dentro del Pipeline
  // options {
    // buildDiscarder(logRotator(numToKeepStr: '3'))
      // disableConcurrentBuilds()
  // }

  //Una sección que define las herramientas “preinstaladas” en Jenkins
  // tools {
    // jdk 'JDK8_Centos' //Preinstalada en la Configuración del Master
    // gradle 'Gradle4.5_Centos' //Preinstalada en la Configuración del Master
  // }

  //Aquí comienzan los “items” del Pipeline
  stages{
    stage('Checkout') {
      steps{
        echo "------------>Checkout<------------"
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], 
            submoduleCfg: [],
            userRemoteConfigs: [[
                credentialsId: 'GitHub_nestormoya',
                url: 'https://github.com/nestormoya/userlist.git'
            ]]
        ])
      }
    }
    
    stage('Compile & Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"

      }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis de código estático<------------'
        // withSonarQubeEnv('Sonar') {
        //  sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
        // }
      }
    }

    stage('Build') {
      steps {
        echo "------------>Build<------------"
        sh 'xcodebuild -scheme CeibaUser -configuration Debug build test -destination "platform=iOS Simulator, name=iPhone 8"'
      }
    }  
  }

  post {
    always {
      echo 'This will always run'
    }
    success {
      echo 'This will run only if successful'
    }
    failure {
      echo 'This will run only if failed'
    }
    unstable {
      echo 'This will run only if the run was marked as unstable'
    }
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}
