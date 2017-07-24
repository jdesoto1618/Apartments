require 'rails_helper'

RSpec.feature "Apartments Page", type: :feature do
  context 'Going to website' do
     Steps 'Being welcomed' do #step 1
       Given 'I am on the landing page' do
         visit '/'
       end
       Then 'I can see the apartments page' do
         expect(page).to have_content("Apartments")
       end
     end #ends step 1

     Steps 'Clicked on new apartment link' do #step 2
       Given 'I am on the add apartment page' do
         visit '/'
         click_link 'New Apartment'
       end
       Then 'I can see the apartments page' do
         expect(page).to have_content("New Apartment")
       end #ends then
     end #ends step 2

      Steps "Clicking create button" do #step 3
         Given "I'm on the add apartment page" do
           visit '/'
           click_link 'New Apartment'
           fill_in 'Street', with: '123'
           click_button 'Create Apartment'
         end #ends given
         Then "I should see this message" do
           expect(page).to have_content 'Apartment was successfully created.'
         end #ends then
         Then "I should see Show Page" do
           expect(page).to have_content 'Street: 123'
         end #ends then
       end #ends step 3

       Steps "Editing an apartment" do #step 4
          Given "I created a new apartment" do
            visit '/'
            click_link 'New Apartment'
            fill_in 'Street', with: '123'
            click_button 'Create Apartment'
            click_link 'Edit'
            fill_in 'Street', with: '7098'
            click_button 'Update Apartment'
          end #ends given
          Then "I should see updated fields" do
            expect(page).to have_content 'Street: 7'
          end #ends then
        end #ends step 4

   end #ends context
end #ends rspec


# expect(page).to have_content will grab any match at all. So if there is a 7 on the page, the test will pass, even if it doesn't exactly match. There is most likely a better method to check inside a field for a value or a string check.

# Apartment was successfully destroyed.
# Editing Apartment
