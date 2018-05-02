# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  describe '#index' do
    before(:each) { get :index }

    it { is_expected.to render_template(:index) }

    it 'has correct meta description' do
      desc_text = 'Kazan, test, app, work'
      desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
      expect(response.body).to have_css(desc_tag, visible: false)
    end

    it 'has correct meta keywords' do
      key_text = 'Kazan, test, app, work'
      key_tag = "meta[name=\"keywords\"][content=\"#{key_text}\"]"
      expect(response.body).to have_css(key_tag, visible: false)
    end
  end
end
