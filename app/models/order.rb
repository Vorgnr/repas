class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :city, :street, presence: true
  scope :to_deliver, -> { where is_delivered: false }

  def address
    "#{self.zip_code} #{self.city} #{self.number} #{self.street}"
  end
end
