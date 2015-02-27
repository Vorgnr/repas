class Order < ActiveRecord::Base
  belongs_to :user

  def destination
    '#{self.zip_code} #{self.city} #{self.number} #{self.street}'
  end
end
