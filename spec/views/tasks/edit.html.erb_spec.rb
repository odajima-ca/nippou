require 'rails_helper'

RSpec.describe 'tasks/edit', type: :view do
  let(:task) { FactoryGirl.create(:task) }

  before(:each) do
    @task = assign(:task, task)
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(@task), 'post' do

      assert_select 'input#task_category_id[name=?]', 'task[category_id]'

      assert_select 'input#task_name[name=?]', 'task[name]'

      assert_select 'textarea#task_description[name=?]', 'task[description]'

      assert_select 'input#task_status[name=?]', 'task[status]'
    end
  end
end
