class User < ActiveRecord::Base
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #Auto creates a blank profile for each new user
  after_create do
    unless self.profile
      Profile.create(:user_id => self.id)
    end
  end

  #Parses stripe's json reponse to retrieve and store the customer code
  def retrieve_id(json)
    self.stripe_customer_id = json['id']
  end

end
