class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :city, :street, presence: true
  validates :number, :numericality => { :not_equal_to => 0 }

  def address
    "#{self.zip_code} #{self.city} #{self.number} #{self.street}"
  end

  private
end
