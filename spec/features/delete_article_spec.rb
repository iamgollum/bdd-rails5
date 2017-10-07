require "rails_helper"

RSpec.feature "Delete Article" do
  
  before do
    @article = Article.create(title: "Article Title", body: "Article Body")
  end
  
  scenario "Article is removed" do
    visit "/"
    
    click_link @article.title
    click_link "Delete Article"
    
    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end