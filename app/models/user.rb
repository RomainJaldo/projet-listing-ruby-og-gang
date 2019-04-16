class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :firstname, :lastname, :email

  has_many :posts
  has_many :messages

  def full_name
    "#{firstname} #{lastname}"
  end

  def rails_admin
    user.is_admin == 'true'
  end

  def generate_token
    self.auth_token = SecureRandom.uuid
    if self.save
      return auth_token
    else
      return nil
    end
  end

end
