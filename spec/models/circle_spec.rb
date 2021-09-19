require 'rails_helper'

RSpec.describe Circle, type: :model do
  
  describe "サークルの作成" do

  	let(:circle){Circle.create(params)}
  	let(:params){{name: "test", slogan: "test", prefecture_code: 1,
  								postal_code: 1111111, address: "test", annual_fee: 1,
  								entry_fee: 1, members_wanted: true}}

  	context "作成成功" do

  		it "サークル名、テーマ、都道府県、郵便番号、住所、参加費、募集ステータスを入力" do
  			expect(circle).to be_valid
  		end
  	end

  	context "作成失敗" do
  		after do
        expect(@circle).to be_invalid
      end

  		it "サークル名が未入力" do
  			@circle = Circle.create(name: "", theme: "test", prefecture_code: 1,
                  postal_code: 1111111, address: "test",
                  entry_fee: 1, members_wanted: true)
  		end
  		it "テーマが未入力" do
  			@circle = Circle.create(name: "test", theme: "", prefecture_code: 1,
                  postal_code: 1111111, address: "test",
                  entry_fee: 1, members_wanted: true)
  		end
  		it "都道府県が未入力" do
  			@circle = Circle.create(name: "test", theme: "test", prefecture_code: "",
                  postal_code: 1111111, address: "test",
                  entry_fee: 1, members_wanted: true)
  		end
  		it "郵便番号が未入力" do
  			@circle = Circle.create(name: "test", theme: "test", prefecture_code: 1,
                  postal_code: "", address: "test",
                  entry_fee: 1, members_wanted: true)
  		end
  		it "住所が未入力" do
  			@circle = Circle.create(name: "test", theme: "test", prefecture_code: 1,
                  postal_code: 1111111, address: "",
                  entry_fee: 1, members_wanted: true)
  		end
  		it "参加費が未入力" do
  			@circle = Circle.create(name: "test", theme: "test", prefecture_code: 1,
                  postal_code: 1111111, address: "test",
                  entry_fee: "", members_wanted: true)
  		end
  		it "募集ステータスが未入力" do
  			@circle = Circle.create(name: "test", theme: "test", prefecture_code: 1,
                  postal_code: 1111111, address: "test",
                  entry_fee: 1, members_wanted: "")
  		end
  	end
  end

  describe "アソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    shared_examples 'has_many' do
      it { expect(association.macro).to eq :has_many }
    end

    context 'users' do
      let(:target) {:users}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'User'}
    end
    context 'bookmarks' do
      let(:target) {:bookmarks}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Bookmark'}
    end
    context 'articles' do
      let(:target) {:articles}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Article'}
    end
    context 'events' do
      let(:target) {:events}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Event'}
    end
    context 'approvals' do
      let(:target) {:approvals}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Approval'}
    end
    context 'active_circle_notifications' do
      let(:target) {:active_circle_notifications}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Notification'}
    end
    context 'passive_circle_notifications' do
      let(:target) {:passive_circle_notifications}
      it_behaves_like 'has_many'
      it { expect(association.class_name).to eq 'Notification'}
    end
  end
end