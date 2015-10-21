require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :sku => "Sku",
        :color => "Color",
        :collection => "Collection",
        :warehouse_inventory => 1,
        :bdbox_inventory => 2,
        :blacklion_inventory => 3,
        :cotswold_inventory => 4,
        :cost_cents => 5,
        :notes => "MyText",
        :wholesale_cents => 6,
        :retail_cents => 7,
        :selling => false
      ),
      Product.create!(
        :title => "Title",
        :sku => "Sku",
        :color => "Color",
        :collection => "Collection",
        :warehouse_inventory => 1,
        :bdbox_inventory => 2,
        :blacklion_inventory => 3,
        :cotswold_inventory => 4,
        :cost_cents => 5,
        :notes => "MyText",
        :wholesale_cents => 6,
        :retail_cents => 7,
        :selling => false
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Collection".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
