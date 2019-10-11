feature 'add bookmark' do
  scenario 'add a new bookmark to the list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'Test Bookmark')
    click_button 'Submit'
    expect(page).to have_link('Test Bookmark', href: 'http://www.google.com')
  end
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end