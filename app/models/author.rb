class Author < ApplicationRecord

  # A custom field defined at model level
  def full_name
    [first_name, last_name].compact.join ' '
  end

  validates :last_name, presence: true

end
