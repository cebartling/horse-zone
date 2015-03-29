require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "create new user" do
    let(:user) {
      User.new(email_address: 'joe.smith001@gmailsnail.co',
               password: 'p4$$w0rD',
               password_confirmation: 'p4$$w0rD')
    }

    it 'is successful' do
      expect(user.save).to be_truthy
    end

    context "authentication" do
      before :each do
        user.save!
      end

      it 'is successful when password matches the password set on the user record' do
        expect(user.authenticate('p4$$w0rD')).to be_truthy
      end

      it 'is unsuccessful when password does not match the password set on the user record' do
        expect(user.authenticate('notR1ghtP4$$worD')).to be_falsey
      end
    end
  end

end
