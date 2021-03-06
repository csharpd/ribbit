require 'rails_helper'

describe 'creating posts' do
  context 'if not logged in' do
    it 'when a user clicks New Post, should be prompted to sign in' do
      visit '/posts'
      click_link 'New Post'
      expect(page).to have_content 'Log in'
    end
  end
  context 'when logged in' do
    before do
      chloe = create(:user)
      login_as chloe
    end
    it 'submit a posts via a form' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Frogs'
      fill_in 'Url', with: 'http://s.ngm.com/2006/11/tree-frogs/img/red-eyed-tree-frogs-615.jpg'
      fill_in 'Description', with: 'Two little frogs'
      click_button 'Create Post'

      expect(page).to have_content 'Frogs'
      expect(page).to have_content 'http://s.ngm.com/2006/11/tree-frogs/img/red-eyed-tree-frogs-615.jpg'
       expect(page).to have_content 'Two little frogs'
       expect(page).to have_content ' Created by xx@xx.com'
      expect(current_path).to eq '/posts'
    end
  end
end