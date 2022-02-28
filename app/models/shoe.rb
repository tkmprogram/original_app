class Shoe < ApplicationRecord
  validates :manufacturer_id, numericality: { other_than: 1 }
  validates :color_id, numericality: { other_than: 1 }
  validates :inout_id, numericality: { other_than: 1 }
  validates :title, presence: true
  validates :explanation, presence: true
  validates :user, presence: true
  validates :image, presence: true

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :manufacturer
  belongs_to :color
  belongs_to :inout

  def self.search(search)
    if search != ""
      Shoe.where('title LIKE(?)', "%#{search}%")
    else
      Shoe.all
    end
  end
end
