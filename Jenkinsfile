node(''){
stage('Initialise'){
def mavenhome = tool 'maven'
env.PATH = "${mavenhome}/bin:${env.PATH}"
}
stage('clone'){
git branch: 'master' ,
credentialsId :'5fdc9f01-d0b3-4305-bb38-e910fbb914a4' ,
url: 'https://github.com/ronnysss/k8s-project.git'
}
stage ('Build'){
sh '''
mvn clean install '''
}
stage('Build Docker Image'){
sh '''
docker build -t sweetyn/springboot-img/:v1 . '''
}
}
