# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'


RSpec.describe User, type: :model do

  it {should validate_presence_of :username}
  it {should validate_uniqueness_of :username}
  it {should validate_presence_of :password_digest}
  it {should validate_presence_of :session_token}
  it {should validate_uniqueness_of :session_token}
    
  describe 'User::find_by_credentials' do    
    it 'finds a user based on the username and password' do
      user = User.create!(username:'mogarcia', password: '1234567')
      expect(User.find_by_credentials('mogarcia', '1234567').to eq(user))      
    end
  end


  # pending "add some examples to (or delete) #{__FILE__}"
end
