class Manufacturer < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'NIKE' },
    { id: 3, name: 'アシックス' },
    { id: 4, name: 'adidas' },
    { id: 5, name: 'ミズノ' },
    { id: 6, name: 'Jordan' },
    { id: 7, name: 'AND1' },
    { id: 8, name: 'UNDER AEMOUR' },
    { id: 9, name: 'Reebok' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :shoes
  end