module FixtureHelper

  def response_fixture(name)
    Rails.root.join( "spec", "responses", name).read
  end

end