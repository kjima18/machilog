require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not be valid without content & Prefecture' do
    post = Post.new(content: '', prefecture_id: '')
    expect(post).not_to be_valid
  end
end
