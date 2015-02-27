class User < ActiveRecord::Base
  has_many :orders
  belongs_to :role
  before_create :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name('customer')
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
