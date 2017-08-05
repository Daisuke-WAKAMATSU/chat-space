require 'rails_helper'
  describe MessagesController, type: :controller do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:member) { create(:member) }
    let(:message) { create(:message) }

  describe 'GET #index' do
    context "ログイン中" do
      before do
        login_user user
      end

      it "アクション内で定義しているインスタンス変数があるか" do
        group = create(:group)
        get :index, params: {group_id: group}
        expect(assigns(:group)).to eq group
      end

      it "該当するビューが描画されているか" do
        get :index, params: {group_id: group}
        expect(response).to render_template :index
      end

      context "メッセージの保存に成功" do
        before do
          login_user user
        end

        it "メッセージの保存ができたか" do
          message = build(:message)
          expect(message).to be_valid
        end

        it "意図した画面に遷移しているか" do
          message = create(:message)
          post :create, params: { group_id: group, message: attributes_for(:message) }
          expect(response).to redirect_to group_messages_path
        end

      end

      context "メッセージの保存に失敗" do
        before do
          login_user user
        end

      #   it "メッセージの保存は行われなかったか" do
      #     expect(response).to render_template :new
      #   end

      #   it "意図したビューが描画されているか" do
      #     expect(response).to render_template :new
      #   end

      # end

    end
  end
end



#   #   #ログイン中で保存に成功(メッセージ作成)


#   #   #ログイン中で保存に失敗(メッセージ作成)




#   # #ログインしていない(表示)
#   #   it "意図したビューにリダイレクトされているか" do
#   #   expect(response).to render_template :new
#   #   end

#   # #ログインしていない(メッセージ作成)
#   #   it "意図した画面にリダイレクトできているか" do
#   #   expect(response).to render_template :new
#   #   end
