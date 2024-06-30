pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/basialx/snakegame-gui'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -f Dockerfile -t snake .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker build -f Dockerfile.tests -t snake.tests .'
                sh 'docker run --rm snake.tests'
            }
        }

    }

    post {
        success {
            echo 'Budowa zakończona sukcesem!'
        }
        failure {
            echo 'Budowa nie powiodła się.'
        }
    }
}

