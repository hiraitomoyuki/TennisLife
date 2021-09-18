require 'rails_helper'

RSpec.describe User, type: :model do

	describe "ユーザーの登録" do

		let(:user){ User.create(params) }
		let(:params){{nickname: "tes", email: "tes@mail", password: "aaaaaa"}}

		context "登録の成功" do
		  	it "ニックネームとメールアドレスとパスワードがあれば登録できる" do
		  		expect(user).to be_valid
		  	end
		end

		context "登録の失敗" do

			subject{ user.to be_invalid}

		  	it "名前がなければ登録できない" do
		  		params[:nickname] = ""
		  	end
		  	it "メールアドレスがなければ登録できない" do
		  		params[:email] = ""
		  	end
		  	it "メールアドレスが重複していたら登録できない" do
		  		@user1 = user
		  		@user2 = User.create(nickname: "taro", email: "tes@mail", password: "aaaaaa")
		  		expect(@user2).to be_invalid
		  	end
		  	it "パスワードがなければ登録できない" do
		  		params[:password] = ""
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

		context 'circle' do
			let(:target) {:circle}
			it { expect(association.macro).to eq :belongs_to }
			it { expect(association.class_name).to eq 'Circle'}
		end
		context 'bookmarks' do
			let(:target) {:bookmarks}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Bookmark'}
		end
		context 'bookmark_circles' do
			let(:target) {:bookmark_circles}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Circle'}
		end
		context 'entries' do
			let(:target) {:entries}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Entry'}
		end
		context 'entry_events' do
			let(:target) {:entry_events}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Event'}
		end
		context 'favorites' do
			let(:target) {:favorites}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Favorite'}
		end
		context 'favorite_articles' do
			let(:target) {:favorite_articles}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Article'}
		end
		context 'comments' do
			let(:target) {:comments}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Comment'}
		end
		context 'approvals' do
			let(:target) {:approvals}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Approval'}
		end
		context 'active_notifications' do
			let(:target) {:active_notifications}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Notification'}
		end
		context 'passive_notifications' do
			let(:target) {:passive_notifications}
			it_behaves_like 'has_many'
			it { expect(association.class_name).to eq 'Notification'}
		end
	end
end