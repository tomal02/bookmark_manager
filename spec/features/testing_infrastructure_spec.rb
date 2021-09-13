feature 'testing infrastructure' do
  scenario 'displays simple index page' do
  visit '/'
  expect(page).to have_content "Welcome to your bookmark manager!"
  end
end