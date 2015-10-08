require 'rails_helper'

RSpec.describe 'tasks/index', type: :view do
  let(:tasks) { FactoryGirl.create_list(:task, 2) }

  before(:each) do
    assign(:tasks, tasks)
  end

  it 'renders a list of tasks' do
    render
    tasks.each do |task|
      assert_select 'tr>td', text: task.name, count: 1
    end
    assert_select 'tr>td', text: tasks.first.description, count: 2
    assert_select 'tr>td', text: tasks.first.status, count: 2
  end
end
