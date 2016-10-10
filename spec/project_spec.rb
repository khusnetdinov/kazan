require 'spec_helper'

RSpec.describe "Project with configuration" do
  before(:all) do
    run_app_generator
  end

  describe "Custom README.md" do
    subject { IO.read("#{project_path}/README.md") }

    it { is_expected.to match(/Requirements/)}
  end
end
