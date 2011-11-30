# Instructions for use:
#
# 1. Install the Jenkins CLI jar file and set its location in the environment variable below.
export JENKINS_CLI="/usr/local/bin/jenkins-cli.jar"

# 2. Set your $JENKINS_URL environment variable (optionally here) to reflect the URL of your Jenkins instance. You can uncomment the line below to do it here.
# export JENKINS_URL="http://ci.mycompany.com/"

# 3. Profit!



# Aliases
alias jenkins="java -jar $JENKINS_CLI"