pipeline {

    agent {

        docker {

            image 'ruby'

        }

    }

    

    stages {

        stage('Buid') {

            steps {

                echo 'Bulding or Resolve Depedenies!'

                sh 'bundle install'

            }

        }

        stage ('Test') {

            steps {ar

                echo 'Executar testes em regressão'

            }

        }

        stage('UAT'){

            steps {

                echo 'Aguarde até aceitação do usuário'

                input(message: 'Go to produção?', ok: 'Yes')

            }

        }

        stage ('Prod') {

            steps {

                echo 'WebApp is :)'

        }

    }

  }

}