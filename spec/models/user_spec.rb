require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not be valid without name' do
    user = User.new(name: '')
    expect(user).not_to be_valid
  end
  
  it 'is not be valid without email' do
    user = User.new(email: '')
    expect(user).not_to be_valid
  end
  
  it 'is not be valid without password' do
    user = User.new(password: '')
    expect(user).not_to be_valid
  end
  
  
  it 'アドレスが重複している場合は無効' do
    User.create(
      name: "test1",
      email: "test@example.com",
      password: "test0000"
    )
    
    @user = User.new(
      name: "test2",
      email: "test@example.com",
      password: "test1111"
    )
    
    @user.valid?
    expect(@user.valid?).to eq(false)
  end
  
end