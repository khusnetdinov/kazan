# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::SeoController, type: :controller do
  render_views

  describe '#robots' do
    before { get :robots }

    it { is_expected.to render_template(:robots) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#sitemap' do
    before { get :sitemap, format: :xml }

    it { is_expected.to render_template(:sitemap) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
