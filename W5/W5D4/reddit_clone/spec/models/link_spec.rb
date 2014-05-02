require 'spec_helper'

describe Link do

  subject(:link) { build(:link, user_id: 1) }

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:sub_memberships) }

    it { should have_many(:subs) }

    it { should have_many(:comments) }
  end

end
