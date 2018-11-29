require 'simplecov'

Dir[File.dirname(File.absolute_path(__FILE__)) + '/**/*.rb'].each {|file| require file }

SimpleCov.start
Dir[File.dirname(File.absolute_path(__FILE__)) + '/test/**/*_test.rb'].each {|file| require file }
