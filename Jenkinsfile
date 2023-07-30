pipeline {
	label {
		label 'build_in'
		customWorkspace '/mnt/project/'
	}
	stages {
		stage('git clone') {
			steps {
	         		git clone "https://github.com/ShivanidMore/onlinebookstore.git"
			}
                }
		stage('maven install') {
			steps {
				dir('/mnt/project/onlinebookstore'){
                                	mvn install
				}
			}
		}
		stage('build success'){
			steps {
	                       echo "build successfully"

			}
                }
		stage('copy war into tomcat'){
			steps { 
				dir('/mnt/project/onlinebookstore'){
					cp target/onlinebookstore.war /mnt/build_tools/apache-tomcat-9.0.78/webapps/
				}
			}
		}
		stage('tomcat start'){
			steps {
				dir('/mnt/build_tools/apache-tomcat-9.0.78/bin'){
					sh "./startup.sh"
                                }
			}
		}
		stage('All Success'){
			steps{
                        	echo "All Success"
			}
		}
        }
}

