# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'
require 'factory_girl'
require 'factories'
require 'fakeweb'

FakeWeb.allow_net_connect = false

#CONNECTIONS
file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "tour_39.html")).to_s
FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/tours.cgi?tourID=39", :content_type => "text/html", :code => 200, :body => file_body)
file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "show_1167.html")).to_s
FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/shows.cgi?showID=1167", :content_type => "text/html", :code => 200, :body => file_body)
file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "venue_1356.html")).to_s
FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/venues.cgi?venueID=1356", :content_type => "text/html", :code => 200, :body => file_body)
file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "song_37.html")).to_s
FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/songs.cgi?songID=37", :content_type => "text/html", :code => 200, :body => file_body)


Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  #
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  #
  # For more information take a look at Spec::Runner::Configuration and Spec::Runner
end
