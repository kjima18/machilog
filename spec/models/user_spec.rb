require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前がなければ登録できない' do
    user = User.new(name: '')
    expect(user.valid?).to eq(false)
  end
  
  it 'メールアドレスがなければ登録できない' do
    user = User.new(email: '')
    expect(user.valid?).to eq(false)
  end
  
  it 'メールアドレスが重複している場合は登録できない' do
    user = FactoryGirl.create(:user)
    
    @user = User.new(
      name: "test2",
      email: "test@example.com",
      password: "test1111"
    )
    
    @user.valid?
    expect(@user.valid?).to eq(false)
  end
  
  it 'パスワードがなければ登録できない' do
    user = User.new(password: '')
    expect(user.valid?).to eq(false)
  end
  
end