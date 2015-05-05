class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  # enum status: [ :live, :expired ]

  validates :title, :description, :price, :expiry_date, :user, :category, presence: true

  before_save :set_expiry

  def status 
  	if (self.expiry_date > Time.now)
  		:live
  	else 
  		:expired
  	end
  end

  def set_expiry
    self.expiry_date = Time.now + 1.minute
  end

end
