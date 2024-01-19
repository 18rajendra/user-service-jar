pipeline{
	agent any
	tools { 
        maven 'maven-3.9.6' 
        jdk 'jdk17' 
    }
	stages{
		stage('clone from github'){
			steps{
			    echo "Clone is running"
				git branch: 'main', url:'https://github.com/18rajendra/user-service-jar.git', credentialsId: '58d59a37-ae7d-4a87-95e3-85d9f24554d3'
			}
		}
		stage('build jar file'){
			steps{
			    echo "Build jar file is Running......"
			    // now you are on slave labeled with 'label'
   

   // workspace = env.WORKSPACE
    // ${workspace} will still contain an absolute path to job workspace on slave

    // When using a GString at least later Jenkins versions could only handle the env.WORKSPACE variant:
    echo "Current workspace is ${env.WORKSPACE}"

    // the current Jenkins instances will support the short syntax, too:
    echo "Current workspace is $WORKSPACE"
				bat "mvn clean compile package"
			}
		}
		stage('deploy'){
			steps{
			    echo "deploy is running....."
			    bat "cd C:\\Users\\rajen\\.jenkins\\workspace\\user-service-pipeline\\target"
			    echo "Inside deploy file is Running......"
			    bat "cd"
			    bat "docker rm -f user-service"
				bat "docker container prune -f"
				bat "docker rmi -f user-service"
				bat "docker build -t user-service ."
				bat "docker run --name user-service -p 8071:8071 -d -e eureka.client.service-url.defaultZone=http://172.17.0.2:8070/eureka user-service"
			}
		}
		
	}
}