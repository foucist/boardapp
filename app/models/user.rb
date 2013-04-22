class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :statuses

  def current_status
    # reset everyone's status at midnight # next step would be to keep some statuses regardless
    if todays_status = Status.where("user_id = ?", self.id).where(:created_at => Time.now.midnight..Time.now).order("created_at DESC").limit(1).first
      todays_status
    else
      self.statuses.create(:entry => "Unknown")
    end
  end

end
