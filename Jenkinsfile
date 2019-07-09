node('') {
   def pom = readMavenPom file: 'pom.xml'
   def mvnVersion = pom.version
   echo mvnVersion
   
   stage('Initialize'){
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
	def buildImageCmd = "echo sindhura | sudo -S docker build -t sweetyn/springboot-img:"+mvnVersion+" ."
	   sh "${buildImageCmd}"
   }
   stage('Upload To DockerHub'){
      sh '''echo sindhura | sudo -S docker login -u sweetyn -p 123sairam123
            
      '''
      sh "echo sindhura | sudo -S docker push sweetyn/springboot-img:"mvnVersion
   }

}
