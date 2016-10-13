require 'rails'

module KazanSpecHelpers
  APP_NAME = 'kazan_spec_app'

  def create_temp_directory
    FileUtils.mkdir_p(temp_path)
  end

  def remove_temp_project_directory
    FileUtils.rm_rf(project_path)
  end

  def run_app_generator(arguments = nil)
    arguments = "--path=#{root_path} #{arguments}"
    Dir.chdir(temp_path) do
      Bundler.with_clean_env do
        `
        #{bin_path} #{APP_NAME} #{arguments}
        `
      end
    end
  end

  def setup_app_dependencies
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          `bundle check || bundle install`
        end
      end
    end
  end

  def drop_app_database
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          `rake db:drop`
        end
      end
    end
  end

  def project_path
    @temp_project_path ||= Pathname.new("#{temp_path}/#{APP_NAME}")
  end

  def temp_project_name
    APP_NAME.humanize
  end

  def load_file(file_name)
    IO.read("#{project_path}/#{file_name}")
  end

  private

  def temp_path
    @temp_path ||= Pathname.new("#{root_path}/temp")
  end

  def bin_path
    File.join(root_path, 'bin', 'kazan')
  end

  def root_path
    File.expand_path('../../../', __FILE__)
  end
end

