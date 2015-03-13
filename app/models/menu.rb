class Menu < ActiveRecord::Base
  has_many :menu_items, foreign_key: :menu_id
  accepts_nested_attributes_for :menu_items

  def slots
    array = []
    array << self.slot_1
    array << self.slot_2
    array << self.slot_3
  end
end
