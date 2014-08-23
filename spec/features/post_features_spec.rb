require 'rails_helper'


describe 'posts' do
  context 'before anyone posts' do
    it 'displays no posts' do
      visit '/posts'
      expect(page).to have_content 'No one has posted a frog joke yet :('
    end
  end
  context 'with posts' do
    before do
      Post.create(title: 'A frog walked in to a bar',url: 'http://www.quickmeme.com/img/16/16d59053f620763afc6a90c22b40581d3561f29a496341a52fcc1c4d00f0c877.jpg', description: 'super funny haha')
    end
    it 'displays the posts' do
      visit '/posts'
      expect(page).to have_content 'A frog walked in to a bar'
    end
  end
end
