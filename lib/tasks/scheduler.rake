desc "This task is called to update the database with information from shopify."
task :update_db => :environment do
  puts "Updating db"
  ShopifyDataPull::ShopifyDataPull.updates
  puts "done."
end
