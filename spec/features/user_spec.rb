require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { create(:user) }

  it "可以註冊" do
    sign_up name: 'cc',
            email: 'cccc@cccc.ccc',
            password: '11111111',
            password_confirm: '11111111'

    expect(page).to have_content '註冊成功'
    expect(current_path).to eq '/'
  end

  it "不可重複註冊" do
    sign_up name: 'cc',
            email: user.email,
            password: '11111111',
            password_confirm: '11111111'

    expect(page).to have_css('.field_with_errors')
    expect(page.status_code).to be 422
  end

  it "可以登入" do
    login email: user.email, password: '12345678'

    expect(page).to have_content '登入成功'
    expect(current_path).to eq '/'
  end

  private

  def sign_up(name:, email:, password:, password_confirm:)
    visit "/"
    click_on "註冊"

    expect(page).to have_content('註冊帳號')

    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirm

    click_on 'SignUp Button'
  end
end
