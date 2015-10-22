# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(title: "Necklace Half Moon", sku: "ABCDEGF", selling: true, notes: "A simple half moon necklace", color: "Silver",
                collection: "Necklaces", warehouse_inventory: 17, cost_cents: 1770, retail_cents: 2999, wholesale_cents:2499)
Product.create!(title: "Bracelet Half Moon", sku: "GDENFGS", selling: false, notes: "A simple half moon bracelet", color: "Gold",
                collection: "Bracelets", cotswold_inventory: 9, cost_cents: 2824, wholesale_cents: 4499, retail_cents: 4999,
                warehouse_inventory: 7)
