require 'rails_helper'
  describe MessagesController, type: :controller do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:member) { create(:member) }

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
    end
  end
end



#   #   #ログイン中で保存に成功(メッセージ作成)
#   #     it "メッセージの保存ができたか" do
#   #     expect(response).to render_template :new
#   #     end

#   #     it "意図した画面に遷移しているか" do
#   #     expect(response).to render_template :new
#   #     end

#   #   #ログイン中で保存に失敗(メッセージ作成)
#   #     it "メッセージの保存は行われなかったか" do
#   #     expect(response).to render_template :new
#   #     end

#   #     it "意図したビューが描画されているか" do
#   #     expect(response).to render_template :new
#   #     end

#   # #ログインしていない(表示)
#   #   it "意図したビューにリダイレクトされているか" do
#   #   expect(response).to render_template :new
#   #   end

#   # #ログインしていない(メッセージ作成)
#   #   it "意図した画面にリダイレクトできているか" do
#   #   expect(response).to render_template :new
#   #   end
