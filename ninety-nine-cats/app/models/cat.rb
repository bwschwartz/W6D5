class Cat < ApplicationRecord
  CAT_COLORS = ['red', 'green', 'blue', 'silver', 'black', 'gold'].freeze

  validates :birthdate, :color, :name, :sex, presence: true
  validates :color, inclusion: {in: CAT_COLORS}
  validates :sex, inclusion: {in: %w[M F]}
  validate :birthdate_cannot_be_future

  def age
   "#{Date.today.year - birthdate.year} years old"
  end

  private
  def birthdate_cannot_be_future
    if birthdate > Date.today
      errors.add(:birthdate, "can't be in the future")
    end
  end

end
