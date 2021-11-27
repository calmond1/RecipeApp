pipeline {
    agent any
    stages {
        stage('Pull Source Code') {
            steps {
			
                git branch: "main", url: 'https://github.com/calmond1/RecipeApp/'
            }
        }
        stage('Docker Build'){
			steps{
				sh '/usr/local/bin/docker-compose build'
			}
        }
        stage('Docker Up'){
			steps{
				sh '/usr/local/bin/docker-compose down'
				sh '/usr/local/bin/docker-compose up -d'
			}
        }
    }
}
