class User < ApplicationRecord
    validates :name, presence: true
    attr_writer :new_user

    def new_user
      @new_user || false
    end

    def self.getUserId(emailAddress, name)
      user = User.find_by(emailid: emailAddress)
      if user
        user.update name: name
      else
        userid = SecureRandom.hex(10)
        user = User.new(emailid: emailAddress, name:name, userid: userid)
        user.new_user = true
        user.save!
      end
      user
    end
end
