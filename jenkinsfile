pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        checkout scm

        // Build the Docker image
        sh 'docker build -t my-laravel-app .'
      }
    }

    stage('Deploy') {
      steps {
        // Deploy the Docker image to your environment
        // Modify this step according to your deployment strategy
        // For example, you might push the image to a Docker registry or deploy it directly to a server
        sh 'docker run -d -p 80:80 my-laravel-app'
      }
    }
  }
}
