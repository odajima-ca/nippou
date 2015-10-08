# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  category_id  :integer          not null
#  name         :string           not null
#  description  :text
#  status       :string           not null
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
    category nil
name "MyString"
description "MyText"
status "MyString"
completed_at "2015-10-08 19:29:49"
  end

end
