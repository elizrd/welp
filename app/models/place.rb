class Place < ActiveRecord::Base
  belongs_to :user
  # Prevents any new place from being saved without a name
  validates :name, presence: true
end
