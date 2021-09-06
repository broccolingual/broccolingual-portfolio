class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 128 }
  validates :body, presence: true, length: { maximum: 3000 }
end
