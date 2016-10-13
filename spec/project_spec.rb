require 'spec_helper'

RSpec.describe 'Project with configuration' do
  before(:all) do
    setup_app_dependencies
    run_app_generator
  end

  after(:all) do
    drop_app_database
  end

  BINSTUBS = [
    'rake',
    'rails',
    'rspec'
  ]

  SETTINGS = [
    'Gemfile',
    'README.md',
    '.ruby-version',
    '.gitignore',
    '.env.development',
    '.env.production',
  ]

  CONFIGS = [
    'database.yml',
    'database.yml.example',
    'puma.rb'
  ]

  INITIALIZERS = [
  ]

  GEMS = [
    'annotate',
    'awesome_print',
    'better_errors',
    'dotenv',
    'pg',
    'puma',
    'rack-mini-profiler',
    'rails'
  ]

  describe 'spring bin' do
    subject { File }

    it { is_expected.to exist("#{project_path}/bin/spring") }
  end

  BINSTUBS.each do |bin_stub|
    describe bin_stub do
      subject { IO.read("#{project_path}/bin/#{bin_stub}") }

      it { is_expected.to match(/spring/) }
    end
  end

  SETTINGS.each do |config|
    describe config do
      subject { load_file config }

      it { is_expected.to be_truthy}
    end
  end

  CONFIGS.each do |config|
    describe config do
      subject { load_file "config/#{config}" }

      it { is_expected.to be_truthy }
    end
  end

  INITIALIZERS.each do |initializer|
   describe initializer do
     subject { load_file "config/initializers/#{initializer}" }

     it { is_expected.to be_truthy }
   end
  end

  # describe 'simple_from.rb' do
    # subject { load_file 'config/initializers/simple_form.rb' }

     # it { is_expected.to be_truthy }
   # end

  describe 'Gemfile' do
    subject { load_file 'Gemfile' }

    GEMS.each do |gem|
      it { is_expected.to include gem }
    end
  end
end
