require 'rails_helper'
  describe MessagesController, type: :controller do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:member) { create(:member) }
    let(:message) { create(:message) }
    let(:index_params) { {group_id: group} }
    let(:create_params) { { group_id: group, message: attributes_for(:message) } }

  describe 'GET #index' do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "アクション内で定義しているインスタンス変数があるか" do
        get :index, params: index_params
        expect(assigns(:group)).to eq group
      end

      it "該当するビューが描画されているか" do
        get :index, params: index_params
        expect(response).to render_template :index
      end
    end

    context "ログインしていない場合" do
      it "意図した画面にリダイレクトできているか" do
        get :index, params: index_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #create' do
    context "ログインしている場合" do
      before do
        login_user user
      end

      context "メッセージの保存に成功" do
        it "メッセージの保存ができたか" do
          message = build(:message)
          expect(message).to be_valid
        end

        it "意図した画面に遷移しているか" do
          message = create(:message)
          post :create, params: create_params
          expect(response).to redirect_to group_messages_path
        end
      end

      context "メッセージの保存に失敗" do
        before do
          login_user user
        end

        it "メッセージの保存は行われなかったか" do
          message = build(:message, body: "", image: "")
          expect(message).to be_invalid
        end

        it "意図したビューが描画されているか" do
          message = build(:message, body: "", image: "")
          post :create, params: create_params
          expect(response).to redirect_to group_messages_path
        end
      end
    end

    context "ログインしていない場合" do
      it "意図した画面にリダイレクトできているか" do
          post :create, params: create_params
          expect(response).to redirect_to new_user_session_path
      end
    end
  end
end





