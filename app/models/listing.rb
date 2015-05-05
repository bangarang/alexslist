class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # enum status: [ :live, :expired ]

  validates :title, :description, :price, :user, :category, presence: true

  before_save :set_expiry

  def status 
  	if (self.expiry_date > Time.now)
  		:live
  	else 
  		:expired
  	end
  end

  def set_expiry
    self.expiry_date = Time.now + 1.week
  end

end
