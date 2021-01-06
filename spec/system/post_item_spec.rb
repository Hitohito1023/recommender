# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:post_item) { create(:post_item, name:'hoge',introduction:'body') }
  describe "投稿画面(post_items_new_path)のテスト" do
    before do
      visit post_items_new_path
    end
    context '表示の確認' do
      it 'post_items_new_pathが"/post_items/new"であるか' do
        expect(current_path).to eq('/post_items/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button 'Post'
      end
    end
  end
end

describe "投稿一覧のテスト" do
  before do
    visit post_items_path
  end
  context '表示の確認' do
    it '投稿されたものが表示されているか' do
      expect(page).to have_content post_item.name
      expect(page).to have_link post_item.name
    end
  end
end

describe "詳細画面のテスト" do
  before do
    visit post_item_path(post_item)
  end
  context '表示の確認' do
    it '削除リンクが存在しているか' do
      expect(page).to have_link 'Destroy'
    end
    it '編集リンクが存在しているか' do
      expect(page).to have_link 'Edit'
    end
  end
  context 'リンクの遷移先の確認' do
    it '編集の変異先は編集画面か' do
      edit_link = find_all('a')[0]
      edit_link.click
      expect(current_path).to eq('/post_items/' + post_item.id.to_s + '/edit')
    end
  end
  context '削除のテスト' do
    it 'post_itemの削除' do
      expect{ post_item.destroy }.to change{ PostItem.count }.by(-1)
    end
  end

  describe '編集画面のテスト' do
    before do
      visit edit_post_item_path(post_item)
    end
    context '表示の確認' do
      it '編集前のタイトルと説明文がフォームに表示されている' do
        expect(page).to have_field 'post_item[name]', with: post_item.name
        expect(page).to have_field 'post_item[introduction]', with: post_item.introduction
      end
      it '保存ボタンが表示されている' do
        expect(page).to have_button '保存'
      end
    end
  end
end