require 'rails_helper'

RSpec.feature "Users", type: :feature do
  it "可以註冊" do
    visit "/"
    click_on "註冊"

    expect(page).to have_content('註冊帳號')

    fill_in 'Name', with: 'fklsfjdkls'
    fill_in 'Email', with: 'cc@cc.cc123'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_on 'SignUp Button'

    expect(page).to have_content '註冊成功'
    expect(current_path).to eq '/'
  end
end
