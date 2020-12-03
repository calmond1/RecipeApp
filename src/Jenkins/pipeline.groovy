pipeline {
    agent any
    stages {
        stage('Pull Source Code') {
            steps {
			
                git branch: "master", url: 'https://github.com/calmond1/RecipeApp/'
            }
        }
        stage('Docker Build'){
			steps{
				sh 'cd src; /usr/local/bin/docker-compose build'
			}
        }
        stage('Docker Up'){
			steps{
				sh 'cd src; /usr/local/bin/docker-compose down'
				sh 'cd src; /usr/local/bin/docker-compose up -d'
			}
        }
    }
}
