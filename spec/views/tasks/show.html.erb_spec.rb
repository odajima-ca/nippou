require 'rails_helper'

RSpec.describe 'tasks/show', type: :view do
  let(:task) { FactoryGirl.create(:task) }

  before(:each) do
    @task = assign(:task, task)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/#{task.name}/)
    expect(rendered).to match(/#{task.description}/)
    expect(rendered).to match(/#{task.status}/)
  end
end
