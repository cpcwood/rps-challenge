ENV['RACK_ENV'] = ENV.fetch('RACK_ENV', 'production')

require './app/controllers/app_controller'

run RPSApp
