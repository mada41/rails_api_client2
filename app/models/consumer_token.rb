require 'oauth/models/consumers/token'
class ConsumerToken < ActiveRecord::Base
  attr_accessible :user_id, :token, :secret, :type
  include Oauth::Models::Consumers::Token

  # You can safely remove this callback if you don't allow login from any of your services
  before_create :create_user

  # Modify this with class_name etc to match your application
  belongs_to :user

  private

  def make_user
    self.user ||= begin
      User.new {}
      user.save(:validate => false)
    end
  end

end
