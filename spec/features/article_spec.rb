require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  context '有登入' do
    let(:user) { create(:user) }

    it "可以新增文章" do
      login(email: user.email, password: '12345678')

      visit articles_path
      click_on '新增文章'

      expect(page).to have_content ('新增文章')
      expect(current_path).to eq new_article_path
    end
  end

  context '沒登入' do
    it "無法新增文章" do
      visit articles_path

      click_on '新增文章'

      expect(page).to have_content ('請先登入會員')
    end
  end
end
