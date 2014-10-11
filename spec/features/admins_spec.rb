require 'rails_helper'

feature "Admins", :type => :feature do
  scenario 'send test email' do
    visit '/'
    click_on 'admin'
    expect(page).to have_content('send test email')
    expect{ click_on 'send test email' }.to change{ Response.count }.by(1)
  end
end
