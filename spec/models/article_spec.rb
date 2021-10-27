require 'rails_helper'

RSpec.describe Article, type: :model do
  # it 'test a number to be a positive' do
    # expect(1).to be_positive # be_positive => 1.posotive? == true
    # expect(5).to be > 2
  it 'tests article object' do
    article = create(:article)
    expect(article.title).to eq('Sample article')
  end
end
