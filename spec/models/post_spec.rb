require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'topic' do
  		let(:target) { :topic }
  		it { expect(association.macro).to eq :belongs_to }
  		it { expect(association.class_name).to eq 'Topic'}
  	end
  end
end