require 'rails_helper'


describe 'posts' do
  context 'before anyone posts' do
    it 'displays no posts' do
      visit '/posts'
      expect(page).to have_content 'No one has posted a frog joke yet :('
    end
  end
end