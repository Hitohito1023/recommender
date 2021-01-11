# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "PostItemsコントローラーのテスト", type: :system do
  describe "投稿のテスト" do
    let!(:user){FactoryBot.create(:user)}
    let(:user2){FactoryBot.create(:user)}
    let!(:genre){FactoryBot.create(:genre)}
    let!(:post_item){FactoryBot.create(:post_item, user:user)}
    let(:post_item2){FactoryBot.create(:post_item, user:user2)}
    before do
    	visit new_user_session_path
    	fill_in 'user[email]', with: user.email
    	fill_in 'user[password]', with: user.password
    	click_button 'ログイン'
    end
    describe "投稿画面のテスト" do
      before do
        visit new_post_item_path
      end
      context "動作の確認" do
        it "投稿に成功する" do
          fill_in 'post_item[name]', with: "aaa"
          fill_in 'post_item[introduction]', with: "aaaaaaaa"
          click_button '投稿'
          expect(current_path).to eq(post_items_complete_path)
        end
        it "投稿に失敗する" do
          click_button "投稿"
          expect(page).to have_content "エラー"
          expect(current_path).to eq(post_items_path)
        end
      end
    end

  end
end