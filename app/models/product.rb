class Product < ActiveRecord::Base
  monetize :cost_cents
  monetize :wholesale_cents
  monetize :retail_cents

  before_validation :default_to_zero_inventory, on: [:create, :update]

  validates :title, presence: true
  validates :sku, presence: true


  def self.search(query, field)
    where("#{field} like ?", "%#{query}%")
  end

  private

  def default_to_zero_inventory
    self.bdbox_inventory = 0 if self.bdbox_inventory.blank?
    self.blacklion_inventory = 0 if self.blacklion_inventory.blank?
    self.cotswold_inventory = 0 if self.cotswold_inventory.blank?
    self.warehouse_inventory = 0 if self.warehouse_inventory.blank?
  end
end
