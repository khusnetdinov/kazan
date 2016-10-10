require 'spec_helper'

RSpec.describe "Project with configuration" do
  before(:all) do
    run_app_generator
  end

  describe "README.md" do
    subject { load_file "README.md" }

    it { is_expected.to match(/Requirements/)}
  end

  describe ".gitignore" do
    subject { load_file ".gitignore" }

    it { is_expected.to be_truthy }
  end

  describe "Gemfile" do
    subject { load_file "Gemfile" }

    it { is_expected.to match(/rubygems\.org/) }
  end

  describe "spring gem setup" do
    subject { File }

    it { is_expected.to exist("#{project_path}/bin/spring") }

    %w(rake rails rspec).each do |bin_stub|
      it "#{bin_stub} bin stubs exist" do
        expect(IO.read("#{project_path}/bin/#{bin_stub}")).to match(/spring/)
      end
    end
  end

  describe "rails gem" do
    subject { load_file "Gemfile" }

    it { is_expected.to match(/rails/) }
  end
end
