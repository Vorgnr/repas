class Order < ActiveRecord::Base
  belongs_to :user
  scope :to_deliver, -> { where is_delivered: false }

  def address
    "#{self.zip_code} #{self.city} #{self.number} #{self.street}"
  end
end
