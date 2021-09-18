require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'user' do
  		let(:target) { :user }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'User'}
  	end
  	context 'event' do
  		let(:target) { :event }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'Event'}
  	end
  end
end