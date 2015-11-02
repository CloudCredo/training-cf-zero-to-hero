require "extract_name_from_host"

require "delegate"

RSpec.describe ExtractNameFromHost do
  subject(:helper) {
    Class.new(SimpleDelegator) {
      def initialize(rspec)
        @rspec = rspec
        super(@rspec)
      end
      include ExtractNameFromHost
    }.new(self)
  }
  let(:request) { double(:request, host: host) }

  context "when host has extra subdomain in front" do
    let(:host) { "www.gerhard.cf-hero.cloudcredo.io" }

    it { expect(helper.name).to eq("Gerhard") }
  end

  context "when host with multi-level subdomain" do
    let(:host) { "gerhard.cf-hero.cloudcredo.io" }

    it { expect(helper.name).to eq("Gerhard") }
  end

  context "when long name with multi-level subdomain" do
    let(:host) { "gerhard-lazu.cf-hero.cloudcredo.io" }

    it { expect(helper.name).to eq("Gerhard Lazu") }
  end

  context "when host subdomain has dashes" do
    let(:host) { "gerhard-cf-hero.cfapps.io" }

    it { expect(helper.name).to eq("Gerhard") }
  end

  context "when host subdomain has dashes and long name" do
    let(:host) { "gerhard-lazu-cf-hero.cfapps.io" }

    it { expect(helper.name).to eq("Gerhard Lazu") }
  end

  context "when host has no subdomain" do
    let(:host) { "localhost" }

    it { expect(helper.name).to eq("Localhost") }
  end
end
