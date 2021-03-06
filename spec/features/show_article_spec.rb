require "rails_helper"

RSpec.feature "Show Article" do
  
  before do
    @article = Article.create(title: "Article Title", body: "Article Body")
  end
  
  scenario "Article exists" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end