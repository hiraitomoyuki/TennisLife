require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'circle' do
  		let(:target) { :circle }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'Circle'}
  	end
  	context 'favorites' do
  		let(:target) { :favorites }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Favorite'}
  	end
  	context 'comments' do
  		let(:target) { :comments }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Comment'}
  	end
  	context 'notifications' do
  		let(:target) { :notifications }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Notification'}
  	end
  end
end
