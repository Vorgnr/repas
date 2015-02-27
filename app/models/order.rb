class Order < ActiveRecord::Base
  belongs_to :user

  def address
    "#{self.zip_code} #{self.city} #{self.number} #{self.street}"
  end

  private
end
