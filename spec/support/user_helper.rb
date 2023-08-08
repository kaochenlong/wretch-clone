module UserHelper
   def login(email:, password:)
     visit "/"

     click_on '登入'
     expect(page).to have_content '會員登入'

     fill_in 'Email', with: email
     fill_in 'Password', with: password
     click_on 'Login Button'
  end
end
