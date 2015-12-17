module ShopifyDataPull
  class ShopifyDataPull

    def self.populate
      api_key = ENV["SHOPIFY_API_KEY"]
      password = ENV["SHOPIFY_PASSWORD"]
      shop_url = "https://#{api_key}:#{password}@fashion-compassion.myshopify.com/admin"
      ShopifyAPI::Base.site = shop_url
      @sproducts = ShopifyAPI::Product.all
      @sproducts.each do |sp|
        sp.variants.each do |variant|
          next if variant.sku == "" or variant.title.include?("wholesale")
          product = Product.new
          product.title = sp.title
          product.sku = variant.sku
          product.color = variant.title
          product.collection = sp.vendor
          product.warehouse_inventory = variant.inventory_quantity
          product.cost = 0
          product.wholesale = 0
          product.notes = ""
          product.retail = variant.price
          product.selling = variant.inventory_policy == "continue"
          product.save
        end
      end
    end

    def self.wholesales
      api_key = ENV["SHOPIFY_API_KEY"]
      password = ENV["SHOPIFY_PASSWORD"]
      shop_url = "https://#{api_key}:#{password}@fashion-compassion.myshopify.com/admin"
      ShopifyAPI::Base.site = shop_url
      @sproducts = ShopifyAPI::Product.all
      @sproducts.each do |sp|
        sp.variants.each do |variant|
          if variant.title.include?("wholesale")
            product = Product.search(variant.sku,:sku).first
            product.warehouse_inventory += variant.inventory_quantity
            product.wholesale = variant.price
            product.save
          end
        end
      end
    end

    def self.updates
      api_key = ENV["SHOPIFY_API_KEY"]
      password = ENV["SHOPIFY_PASSWORD"]
      shop_url = "https://#{api_key}:#{password}@fashion-compassion.myshopify.com/admin"
      ShopifyAPI::Base.site = shop_url
      @sproducts = ShopifyAPI::Product.all
      @sproducts.each do |sp|
        sp.variant.each do |variant|
          p = Product.search(variant.sku,:sku).first
          p.warehouse_inventory = 0
          p.save
        end
      end
      @sproducts.each do |sp|
        sp.variants.each do |variant|
          p = Product.search(variant.sku,:sku).first
          p.title = sp.title
          p.color = variant.title
          p.collection = sp.vendor
          p.warehouse_inventory += variant.inventory_quantity
          if variant.title.include?("wholesale")
            p.wholesale = variant.price
          else
            p.retail = variant.price
          end
          p.selling = variant.inventory_policy == "continue"
          p.save
        end
      end
    end
  end
end
