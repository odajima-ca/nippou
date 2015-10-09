require 'rails_helper'

RSpec.describe DailyReportsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/daily_reports').to route_to('daily_reports#index')
    end

  end
end
