class User < ActiveRecord::Base
  attr_accessible :name, :num_translate

  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
