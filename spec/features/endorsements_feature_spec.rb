describe 'votes' do


  context 'with up votes' do
      before do
    chloe = create(:user)
    login_as chloe
    create(:post, user: chloe)
  end
    it "can up vote a post, positively updating the post's vote count" do
      visit '/posts'
      click_link 'Upvote'

      expect(page).to have_content '1 vote'
   end
  end

  context 'with down votes' do
      before do
    chloe = create(:user)
    login_as chloe
    create(:post, user: chloe)
  end
    it "can down vote a post, detracting from the post's vote count" do
       visit '/posts'
       click_link 'Upvote'
       click_link 'Downvote'
       expect(page).to have_content '0 vote'

     end
  end
end