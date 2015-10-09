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

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Validates' do
    describe 'category_id' do
      describe 'presence' do
        let(:task) { FactoryGirl.build(:task, category_id: nil) }
        it { expect(task.valid?).to be_falsey }
      end
    end
    describe 'name' do
      describe 'presence' do
        let(:task) { FactoryGirl.build(:task, name: nil) }
        it { expect(task.valid?).to be_falsey }
      end
    end
    describe 'status' do
      describe 'presence' do
        let(:task) { FactoryGirl.build(:task, status: nil) }
        it { expect(task.valid?).to be_falsey }
      end
    end
  end

  describe '#done!' do
    let!(:task) { FactoryGirl.create(:task, status: :doing) }
    subject(:exec) { task.done! }

    it 'ステータスがdoneになること' do
      exec
      expect(task.done?).to be_truthy
    end

    it 'complted_atに日付が入ること' do
      exec
      expect(task.completed_at).to_not be_nil
    end
  end
end
