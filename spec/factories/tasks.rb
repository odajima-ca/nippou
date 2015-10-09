# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  category_id  :integer          not null
#  name         :string           not null
#  description  :text
#  status       :integer          not null
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tasks_on_category_id  (category_id)
#

FactoryGirl.define do
  factory :task do
    sequence(:category_id) { FactoryGirl.create(:category).id }
    sequence(:name) { |n| "タスク#{n}" }
    description 'タスクの説明'
    status :todo
    completed_at nil
  end
end
