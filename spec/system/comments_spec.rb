require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @comment = Faker::Lorem.sentence
    @product = FactoryBot.build(:product)
    @user = FactoryBot.build(:user)
    
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # 予め、ユーザーと商品をDBに保存する
    @user = FactoryBot.create(:user)
    # サインインページへ移動する
    visit new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
     # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
     # ログインボタンをクリックする
    find('input[name="commit"]').click
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
    # 商品詳細ページに遷移する
    @product = FactoryBot.create(:product)
    visit product_path(@product)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect do
      click_button "コメントする"
    end.to change(Comment, :count).by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq product_path(@product)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end