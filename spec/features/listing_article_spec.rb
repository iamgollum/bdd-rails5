require "rails_helper"

RSpec.feature "Listing Articles" do
  
  # Create 2 articles to display
  # List the articles
  # expect both article titles and bodies to be present
  
  before do
    @article1 = Article.create(title: "The first article", body: "Lorem ipsum 1")
    @article2 = Article.create(title: "The second article", body: "Lorem ipsum 2")
    @articles = [@article1, @article2]
  end
  
  scenario "A user can view all articles" do
    visit "/"
    
    # expect(page).to have_content("Articles")
    # expect(page.current_path).to eq(articles_path)
    
    @articles.each do  |article|
      expect(page).to have_content(article.title)
      expect(page).to have_link(article.title)
      expect(page).to have_content(article.body)
    end
  end
end