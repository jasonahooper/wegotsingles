class User < ActiveRecord::Base
  has_one :profile
  has_many :received_messages, :class_name => "Message", :foreign_key => "to_id"
  has_many :sent_messages, :class_name => "Message", :foreign_key => "from_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #Auto creates a blank profile for each new user
  after_create do 
    Profile.create(:user_id => self.id)
  end

  #Parses stripe's json reponse to retrieve and store the customer code
  def retrieve_id(json)
    self.stripe_customer_id = json['id']
  end

end
