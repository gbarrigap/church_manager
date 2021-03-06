class Priest < ApplicationRecord
  belongs_to :church
  has_many :baptisms

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def name_for_display
    display_name || full_name
  end
end
