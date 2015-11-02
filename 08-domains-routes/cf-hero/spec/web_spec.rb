require "web"

require "rack/test"

RSpec.describe Web do
  include Rack::Test::Methods

  def app
    @app ||= Web.new
  end

  describe "GET /" do
    let(:home_page) {
      get "/"
      last_response.body
    }

    it "name from host" do
      expect(home_page).to match(/Example,.+ Cloud Foundry .+Hero/)
    end

    context "when SUPERHERO env is set" do
      before { ENV.store("SUPERHERO", "true") }

      it "has superhero class" do
        expect(home_page).to include('class="superhero"')
      end
    end
  end
end
