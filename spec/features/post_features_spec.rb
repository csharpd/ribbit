require 'rails_helper'


describe 'posts' do
  context 'before anyone posts' do
    it "displays 'no posts yet' message" do
      visit '/posts'
      expect(page).to have_content 'No one has posted a frog joke yet :('
    end
  end
  context 'with posts' do
    before do
      chloe = create(:user)
      login_as chloe
      create(:post, user: chloe)
    end
    it 'displays them' do
      visit '/posts'
      expect(page).to have_content 'There once was a frog'
      expect(page).to have_content 'http://content.mycutegraphics.com/graphics/frog/cartoon-frog.png'
      expect(page).to have_content 'He was green'
    end
  end
end
