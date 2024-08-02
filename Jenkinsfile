pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockercrd') // Use your DockerHub credentials ID in Jenkins
        DOCKERHUB_REPO = 'neelpatel5270/static-website' // Your DockerHub repository
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    try {
                        git branch: 'main', url: 'https://github.com/neel5270/static-website.git'
                    } catch (Exception e) {
                        error "Failed to clone repository: ${e.message}"
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        docker.build("${DOCKERHUB_REPO}:latest", ".")
                    } catch (Exception e) {
                        error "Failed to build Docker image: ${e.message}"
                    }
                }
            }
        }
        stage('Test DockerHub Credentials') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockercrd') {
                        echo 'DockerHub login successful'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    try {
                        docker.withRegistry('https://index.docker.io/v1/', 'dockercrd') {
                            docker.image("${DOCKERHUB_REPO}:latest").push()
                        }
                    } catch (Exception e) {
                        error "Failed to push Docker image: ${e.message}"
                    }
                }
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    try {
                        sh '''
                            if [ $(docker ps -aq -f name=static-website) ]; then
                                docker rm -f static-website
                            fi
                            docker run -d --name static-website -p 8081:80 neelpatel5270/static-website:latest
                        '''
                    } catch (Exception e) {
                        error "Failed to deploy container: ${e.message}"
                    }
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                script {
                    try {
                        ansiblePlaybook(
                            playbook: 'ansible/playbook.yml',
                            inventory: 'ansible/inventory.ini',
                            colorized: true
                        )
                    } catch (Exception e) {
                        error "Failed to run Ansible playbook: ${e.message}"
                    }
                }pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockercrd') // Use your DockerHub credentials ID in Jenkins
        DOCKERHUB_REPO = 'neelpatel5270/static-website' // Your DockerHub repository
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    try {
                        git branch: 'main', url: 'https://github.com/neel5270/static-website.git'
                    } catch (Exception e) {
                        error "Failed to clone repository: ${e.message}"
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        docker.build("${DOCKERHUB_REPO}:latest", ".")
                    } catch (Exception e) {
                        error "Failed to build Docker image: ${e.message}"
                    }
                }
            }
        }
        stage('Test DockerHub Credentials') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockercrd') {
                        echo 'DockerHub login successful'

            }
        }
    }
}
