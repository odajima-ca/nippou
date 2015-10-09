require 'rails_helper'

RSpec.describe DailyReportsController, type: :controller do

  describe 'GET #index' do
    let!(:todo_tasks) { FactoryGirl.create_list(:task, 1, status: :todo) }
    let!(:doing_tasks) { FactoryGirl.create_list(:task, 2, status: :doing) }
    let!(:done_tasks) { FactoryGirl.create_list(:task, 3, status: :done, completed_at: Time.current) }
    let!(:old_done_tasks) { FactoryGirl.create_list(:task, 1, status: :done, completed_at: 1.days.ago) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:today)).to eq Date.today
      expect(assigns(:todo_tasks)).to match_array todo_tasks
      expect(assigns(:doing_tasks)).to match_array doing_tasks
      expect(assigns(:done_tasks)).to match_array done_tasks
    end
  end
end
