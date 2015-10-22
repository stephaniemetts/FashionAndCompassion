# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all

Product.create!(title: "Necklace Half Moon", sku: "ABCDEGF", selling: true, notes: "A simple half moon necklace", color: "Silver",
                collection: "Necklaces", warehouse_inventory: 8, cost_cents: 1770, retail_cents: 2999, wholesale_cents:2499)
Product.create!(title: "Necklace Half Moon", sku: "ABCDEGD", selling: true, notes: "A simple half moon necklace", color: "Gold",
                collection: "Necklaces", warehouse_inventory: 17, cost_cents: 1770, retail_cents: 2999, wholesale_cents:2499)
Product.create!(title: "Necklace Half Moon", sku: "ABCDEGA", selling: true, notes: "A simple half moon necklace", color: "White Gold",
                collection: "Necklaces", warehouse_inventory: 12, cost_cents: 1770, retail_cents: 2999, wholesale_cents:2499)
Product.create!(title: "Bracelet Half Moon", sku: "GDENFGS", selling: false, notes: "A simple half moon bracelet", color: "Gold",
                collection: "Bracelets", cotswold_inventory: 9, cost_cents: 2824, wholesale_cents: 4499, retail_cents: 4999,
                warehouse_inventory: 7)
Product.create!(title: "Bracelet Half Moon", sku: "GDENFGR", selling: true, notes: "A simple half moon bracelet", color: "Silver",
                collection: "Bracelets", cotswold_inventory: 0, cost_cents: 2824, wholesale_cents: 4499, retail_cents: 4999,
                warehouse_inventory: 18)
Product.create!(title: "Bracelet Half Moon", sku: "GDENFGB", selling: false, notes: "A simple half moon bracelet", color: "Brass",
                collection: "Bracelets", cotswold_inventory: 0, cost_cents: 2824, wholesale_cents: 4499, retail_cents: 4999,
                warehouse_inventory: 4, blacklion_inventory: 8)
Product.create!(title: "F&C T-Shirt", sku: "HSDF782", selling: true, notes: "Fashion and Compassion Logo T-Shirt", color: "White",
                collection: "Shirts", cotswold_inventory: 0, cost_cents: 1249, wholesale_cents: 1999, retail_cents: 2599,
                warehouse_inventory: 19)
Product.create!(title: "F&C T-Shirt", sku: "HSDF784", selling: true, notes: "Fashion and Compassion Logo T-Shirt", color: "Black",
                collection: "Shirts", cotswold_inventory: 0, cost_cents: 1249, wholesale_cents: 1999, retail_cents: 2599,
                warehouse_inventory: 3, blacklion_inventory: 13)
Product.create!(title: "F&C T-Shirt", sku: "HSDF783", selling: true, notes: "Fashion and Compassion Logo T-Shirt", color: "Blue",
                collection: "Shirts", cotswold_inventory: 0, cost_cents: 1249, wholesale_cents: 1999, retail_cents: 2599,
                warehouse_inventory: 31)
Product.create!(title: "F&C T-Shirt", sku: "HSDF785", selling: true, notes: "Fashion and Compassion Logo T-Shirt", color: "Green",
                collection: "Shirts", cotswold_inventory: 0, cost_cents: 1249, wholesale_cents: 1999, retail_cents: 2599,
                warehouse_inventory: 0, bdbox_inventory: 6)
Product.create!(title: "Ballot Skirt", sku: "YSHZ76F", selling: true, notes: "Basic Ballot Skirt", color: "Red",
                collection: "Skirts", warehouse_inventory: 7, cost_cents:1879, wholesale_cents: 0, retail_cents: 2599)
Product.create!(title: "Ballot Skirt", sku: "YSHZ76H", selling: true, notes: "Basic Ballot Skirt", color: "Burgandy",
                collection: "Skirts", warehouse_inventory: 9, cost_cents:1879, wholesale_cents: 0, retail_cents: 2599)
Product.create!(title: "Ballot Skirt", sku: "YSHZ76I", selling: true, notes: "Basic Ballot Skirt", color: "Seafoam",
                collection: "Skirts", warehouse_inventory: 4, cost_cents:1879, wholesale_cents: 0, retail_cents: 2599)
Product.create!(title: "Ballot Skirt", sku: "YSHZ76G", selling: true, notes: "Basic Ballot Skirt", color: "Peach",
                collection: "Skirts", warehouse_inventory: 11, cost_cents:1879, wholesale_cents: 0, retail_cents: 2599)
Product.create!(title: "Necklace Twisted Heart", sku: "A78BYS8", selling: true, notes: "Twisted Heart Necklace", color: "Silver",
                collection: "Necklaces", warehouse_inventory: 5, cost_cents: 1889, retail_cents:2999, wholesale_cents:2499)
Product.create!(title: "Necklace Twisted Heart", sku: "A78BYS9", selling: true, notes: "Twisted Heart Necklace", color: "Brass",
                collection: "Necklaces", warehouse_inventory: 0, cost_cents: 1889, retail_cents:2999, wholesale_cents:2499)
Product.create!(title: "Necklace Twisted Heart", sku: "A78BYS0", selling: true, notes: "Twisted Heart Necklace", color: "White Gold",
                collection: "Necklaces", warehouse_inventory: 1, cost_cents: 1889, retail_cents:2999, wholesale_cents:2499)
Product.create!(title: "Necklace Twisted Heart", sku: "A78BYS3", selling: true, notes: "Twisted Heart Necklace", color: "Stainless Steel",
                collection: "Necklaces", warehouse_inventory: 8, bdbox_inventory: 7, cost_cents: 1889, retail_cents:2999, wholesale_cents:2499)