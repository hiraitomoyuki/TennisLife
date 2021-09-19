require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'circle' do
  		let(:target) { :circle }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'Circle'}
  	end
  	context 'entries' do
  		let(:target) { :entries }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Entry'}
  	end
  	context 'entry_users' do
  		let(:target) { :entry_users }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'User'}
  	end
  	context 'notifications' do
  		let(:target) { :notifications }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Notification'}
  	end
  end
end