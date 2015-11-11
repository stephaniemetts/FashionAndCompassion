class Product < ActiveRecord::Base

  audited
  monetize :cost_cents
  monetize :wholesale_cents
  monetize :retail_cents

  before_validation :default_to_zero_inventory, on: [:create, :update]

  validates :title, presence: true
  validates :sku, presence: true, uniqueness: true


  def self.get(id)
    find(id)
  end

  def self.search(query, field)
    where("#{field} like ?", "%#{query}%")
  end

  def self.inventory_under(value)
    @products = self.all
    @products.select{|x| x.total_inventory < value}
  end

  def total_inventory
    self.blacklion_inventory + self.bdbox_inventory + self.cotswold_inventory + self.warehouse_inventory
  end

  def turnover(start_date, end_date)
    @turnover = 0
    @audits = Audited::Adapters::ActiveRecord::Audit.where("auditable_id = ?", self.id)
    @filtered = @audits.select{|x| (x.created_at.to_date >= start_date and x.created_at.to_date <= end_date)}
    @filtered.each do |audit|
      audit.audited_changes.each do |change|
        key = change.first
        if key == "bdbox_inventory" || key == "cotswold_inventory" || key == "warehouse_inventory" || key == "blacklion_inventory"
          change = change.last.last - change.last.first
          if change > 0
            @turnover += change
          end
        end
      end
    end
    return @turnover
  end

  private

  def default_to_zero_inventory
    self.bdbox_inventory = 0 if self.bdbox_inventory.blank?
    self.blacklion_inventory = 0 if self.blacklion_inventory.blank?
    self.cotswold_inventory = 0 if self.cotswold_inventory.blank?
    self.warehouse_inventory = 0 if self.warehouse_inventory.blank?
  end
end
