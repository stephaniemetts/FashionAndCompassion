require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Collection/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/false/)
  end
end
