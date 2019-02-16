class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates_presence_of :user_name

  def first_name 
    self.user_name.split.first 
  end 

  def first_name 
    self.user_name.split.last
  end 

end
