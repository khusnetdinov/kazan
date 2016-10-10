RSpec.configure do |config|
  config.before(:all) do
    create_temp_directory
  end

  config.before(:each) do
  end

  config.after(:each) do
  end

  config.after(:all) do
    remove_temp_project_directory
  end
end
