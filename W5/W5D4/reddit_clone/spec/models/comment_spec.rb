require 'spec_helper'

describe Comment do

  subject(:comment) {build(:comment, user_id: 1, link_id: 1) }
  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of (:user_id) }
    it { should validate_presence_of (:link_id) }
    it { should validate_presence_of (:body) }
  end

  describe "associations" do
    it { should belong_to(:link) }
    it { should belong_to(:user) }

    context "with parent comment" do
      it "has a parent" do
        3.times { create(:comment, user_id: 1, link_id: 1) }
        comment2 = build(:comment, user_id: 1, link_id: 1, parent_comment_id: 1)
        expect(comment2.parent.class).to be(Comment)
      end
    end
  end


end
