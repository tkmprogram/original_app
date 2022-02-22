class Inout < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '室内専用' },
    { id: 3, name: 'XDR' },
    { id: 4, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :shoes
  end