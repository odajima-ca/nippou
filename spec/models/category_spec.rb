# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validates' do
    describe 'name' do
      describe 'presence' do
        let(:category) { FactoryGirl.build(:category, name: nil) }
        it { expect(category.valid?).to be_falsey }
      end
    end
  end
end
