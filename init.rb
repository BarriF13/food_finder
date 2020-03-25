#### Food Finder ####
#

APP_ROOT = File.dirname(__FILE__)

require_relative('lib/guide')

guide = Guide.new('restaurants.txt')
guide.launch!