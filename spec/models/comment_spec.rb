require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'user' do
  		let(:target) { :user }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'User'}
  	end
  	context 'article' do
  		let(:target) { :article }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'Article'}
  	end
  	context 'notifications' do
  		let(:target) { :notifications }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Notification'}
  	end
  end
end