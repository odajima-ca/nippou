require 'rails_helper'

RSpec.describe 'tasks/new', type: :view do
  before(:each) do
    assign(:task, FactoryGirl.build(:task))
  end

  it 'renders new task form' do
    render

    assert_select 'form[action=?][method=?]', tasks_path, 'post' do

      assert_select 'select#task_category_id[name=?]', 'task[category_id]'

      assert_select 'input#task_name[name=?]', 'task[name]'

      assert_select 'textarea#task_description[name=?]', 'task[description]'
    end
  end
end
