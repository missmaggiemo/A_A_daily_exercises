require 'spec_helper'

describe User do
  subject(:user) { build(:user)}

  it {should be_valid}

  describe "validations" do
    it {should validate_presence_of(:email)}
  end


  describe "associations" do
    it { should have_many(:moderated_subs) }

    it { should have_many(:comments) }

  end



end
