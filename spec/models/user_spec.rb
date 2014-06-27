require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Joe",
      last_name: "Bloggs",
      email: "joe@email.com",
      password: "testpassword",
      password_confirmation: "testpassword"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "JOE@EMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "joe"
      expect(user).to_not be_valid
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JOE@EMAIL.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("JOE@EMAIL.COM").
        to("joe@email.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "MIKE@EMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("mike@email.com")
    end
  end
end
