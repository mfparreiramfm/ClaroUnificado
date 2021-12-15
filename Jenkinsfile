pipeline {
    agent any

    stages{
        stage("Build"){
            steps{
                echo "Building or Resolve dependecies!"
                sh "rm -f Gemfile.lock"
                sh 'bundle install'
            }
        }
        stage("Test"){
            steps{
                echo "Testing!"
                sh 'cucumber -p hmg -p pretty --publish -p json'
                
            }
            post{
                always{
                    cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                }
            }
        }
        stage("UAT"){
            steps{
                echo "Building or Resolve dependecies!"
            }
        }
          stage("PROD"){
            steps{
                echo "Building or Resolve dependecies!"
            }
        }
    }
}
