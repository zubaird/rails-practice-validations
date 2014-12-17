class Person < ActiveRecord::Base

  validate :date_of_birth, :younger_than_18_years
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true


  def younger_than_18_years
    if date_of_birth == nil
      errors.add(:date_of_birth, "Older than 18 years")
    elsif (date_of_birth.to_date + 18.years) < Date.today
      errors.add(:date_of_birth, "Older than 18 years")
    end
  end

end
