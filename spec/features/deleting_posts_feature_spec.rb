describe 'Deleting posts' do
  before do
    @chloe = create(:user)
    @olive = create(:olive)
    create(:post, user: @chloe)
  end
  context 'logged in as the post creator' do
    before do
      login_as @chloe
    end
    it 'lets the user delete the post' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'There once was a frog'
      expect(current_path).to eq '/posts'
    end
  end
    context 'logged in as another user' do
      before do
      login_as @olive
    end
    it 'it should display an error when they try to delete the post' do

      visit '/posts'
      click_link 'Delete'

      expect(page).to have_content "This is not your post!"
    end
  end
end