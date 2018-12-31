class Article < ApplicationRecord

  has_many :comments, dependent: :destroy


  validate :capitalized

  validates :title, presence: true, length: { minimum: 5 },  exclusion: { in: ["arse", "ass", "asshole", "motherfucker"], message: "'%{value}' is not an allowed word, please avoid being vulgar."}

  validates :terms_of_service, acceptance: { message: "must be accepted in order to create a post.", accept: ['1', true] }
end


def capitalized
  if ('a'..'z').to_a.include?(title[0])
    errors.add(:title, " must be capitalized.")
  end
end
