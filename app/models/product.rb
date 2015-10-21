class Product < ActiveRecord::Base
  monetize :price_cents
  monetize :wholesale_cents
  monetize :retail_cents

end
