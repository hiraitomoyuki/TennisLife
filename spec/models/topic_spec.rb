require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'アソシエーション' do
  	let(:association) do
  		described_class.reflect_on_association(target)
  	end

  	context 'posts' do
  		let(:target) { :posts }
  		it { expect(association.macro).to eq :has_many }
  		it { expect(association.class_name).to eq 'Post'}
  	end
  end
end