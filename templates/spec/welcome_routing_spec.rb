# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :routing do
  describe '#index' do
    subject { get root_path }

    it { is_expected.to be_routable }
    it { is_expected.to route_to(controller: 'web/welcome', action: 'index') }
  end
end
