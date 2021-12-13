require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "rspec"
require "cucumber"
require "tiny_tds"
require "site_prism"
require "httparty"
require 'send-keys'



CONFIG = YAML.load_file(File.join(Dir.pwd,"features/support/config/#{ENV["ENV_TYPE"]}.yaml"))


  
#Verificando qual o browser deverá ser carregado para a execução dos testes
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 40
end


#Recebe como parâmetro o browser a ser emulado
$browser = ENV['BROWSER']
Capybara.page.driver.browser.manage.window.maximize

