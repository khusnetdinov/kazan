require 'spec_helper'

RSpec.describe 'Project with configuration' do
  before(:all) do
    setup_app_dependencies
    run_app_generator
  end

  after(:all) do
    drop_app_database
  end

  describe 'spring gem setup' do
    subject { File }

    it { is_expected.to exist("#{project_path}/bin/spring") }

    %w(rake rails rspec).each do |bin_stub|
      it "#{bin_stub} bin stubs exist" do
        expect(IO.read("#{project_path}/bin/#{bin_stub}")).to match(/spring/)
      end
    end
  end

  %w(README.md .gitignore .ruby-version).each do |config|
    describe config do
      subject { load_file config }

      it { is_expected.to be_truthy}
    end
  end

  %w(database.yml database.yml.example puma.rb).each do |config|
    describe config do
      subject { load_file "config/#{config}" }

      it { is_expected.to be_truthy }
    end
  end

  %w(simple_form.rb).each do |initializer|
    describe initializer do
      subject { load_file "config/initializers/#{initializer}" }

      it { is_expected.to be_truthy }
    end
  end

  describe 'Gemfile' do
    subject { load_file 'Gemfile' }

    it { is_expected.to include %{source} }
    it { is_expected.to include %{gem 'rails'} }
    it { is_expected.to include %{gem 'rack-mini-profiler', require: false} }
    it { is_expected.to include %{gem 'better_errors'} }
    it { is_expected.to include %{gem 'annotate'} }
    it { is_expected.to include %{gem 'awesome_print'} }
    it { is_expected.to include %{gem 'pg'} }
    it { is_expected.to include %{gem 'puma'} }
  end
end
