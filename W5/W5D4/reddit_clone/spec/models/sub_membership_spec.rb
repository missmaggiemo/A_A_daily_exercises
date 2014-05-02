require 'spec_helper'

describe SubMembership do

  describe "validations" do
    it { should validate_presence_of(:link_id) }
    it { should validate_presence_of(:sub_id) }
    it { should validate_uniqueness_of(:link_id).scoped_to(:sub_id) }
  end

  describe "associations" do

    it { should belong_to(:link) }
    it { should belong_to(:sub) }

  end

end
