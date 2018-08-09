# frozen_string_literal: true

require 'spec_helper'

describe Kazan do
  describe 'version' do
    subject { Kazan::VERSION }

    it { is_expected.not_to be_nil }
  end

  describe 'rails version' do
    subject { Kazan::RUBY_PROJECT_VERSION }

    it { is_expected.not_to be nil }
  end

  describe 'ruby version' do
    subject { Kazan::RAILS_VERSION }

    it { is_expected.not_to be_nil }
  end
end
