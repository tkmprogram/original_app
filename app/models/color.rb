class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Black' },
    { id: 3, name: 'White' },
    { id: 4, name: 'Red' },
    { id: 5, name: 'Blue' },
    { id: 6, name: 'Yellow' },
    { id: 7, name: 'Silver' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :shoes
  end