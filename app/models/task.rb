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

class Task < ActiveRecord::Base
  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true
  validates :status, presence: true
end
