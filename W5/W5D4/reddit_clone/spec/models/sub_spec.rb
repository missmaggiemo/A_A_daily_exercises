require 'spec_helper'

describe Sub do

  subject(:sub) {build(:sub)}

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:user_id) }

  end

  describe "associations" do
    it { should belong_to(:moderator) }
    it { should have_many(:sub_memberships) }

    it { should have_many(:links) }
  end

end
