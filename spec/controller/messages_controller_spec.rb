require 'rails_helper'
  describe MessagesController, type: :controller do
    let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      login_user user
    end

  # ログイン中(表示)
    it "アクション内で定義しているインスタンス変数があるか" do
      group = create(:group)
      get :index
      expect(assigns(:group)).to eq group
    end
  end
end

#   #   it "該当するビューが描画されているか" do
#   #   expect(response).to render_template :new
#   #   end

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
