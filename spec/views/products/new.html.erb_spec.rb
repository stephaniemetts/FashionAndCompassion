require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :title => "MyString",
      :sku => "MyString",
      :color => "MyString",
      :collection => "MyString",
      :warehouse_inventory => 1,
      :bdbox_inventory => 1,
      :blacklion_inventory => 1,
      :cotswold_inventory => 1,
      :cost_cents => 1,
      :notes => "MyText",
      :wholesale_cents => 1,
      :retail_cents => 1,
      :selling => false
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_title[name=?]", "product[title]"

      assert_select "input#product_sku[name=?]", "product[sku]"

      assert_select "input#product_color[name=?]", "product[color]"

      assert_select "input#product_collection[name=?]", "product[collection]"

      assert_select "input#product_warehouse_inventory[name=?]", "product[warehouse_inventory]"

      assert_select "input#product_bdbox_inventory[name=?]", "product[bdbox_inventory]"

      assert_select "input#product_blacklion_inventory[name=?]", "product[blacklion_inventory]"

      assert_select "input#product_cotswold_inventory[name=?]", "product[cotswold_inventory]"

      assert_select "input#product_cost_cents[name=?]", "product[cost_cents]"

      assert_select "textarea#product_notes[name=?]", "product[notes]"

      assert_select "input#product_wholesale_cents[name=?]", "product[wholesale_cents]"

      assert_select "input#product_retail_cents[name=?]", "product[retail_cents]"

      assert_select "input#product_selling[name=?]", "product[selling]"
    end
  end
end
