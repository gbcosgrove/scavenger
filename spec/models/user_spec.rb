require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name:             "Greg",
      last_name:              "Cosgrove",
      email:                  "gregcosgrove@gmail.com",
      password:               "test12345",
      password_confirmation:  "test12345"
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
      user.email = "JOEBLOGGS@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "bob"
      expect(user).to_not be_valid
    end
  end

  context "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JOEBLOGGS@GMAIL.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("JOEBLOGGS@GMAIL.COM").
        to("joebloggs@gmail.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
        user.email = "GREGCOSGROVE@GMAIL.COM"
        expect(user.save).to be_true
        expect(user.email).to eq("gregcosgrove@gmail.com")
      end
  end

end
