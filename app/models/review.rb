class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
   
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :description, presence: true, allow_blank: false
  validates :rating, numericality: { only_integer: true }

  def average_rating
    self.reviews.average(:rating)
  end

end
