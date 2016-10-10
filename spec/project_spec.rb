require 'spec_helper'

RSpec.describe "Project with configuration" do
  before(:all) do
    run_app_generator
  end

  describe "README.md" do
    subject { IO.read("#{project_path}/README.md") }

    it { is_expected.to match(/Requirements/)}
  end

  describe ".gitignore" do
    subject { IO.read("#{project_path}/.gitignore") }

    it { is_expected.to be_truthy }
  end
end
