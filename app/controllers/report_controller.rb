class ReportController < ApplicationController
  before_action :require_admin

  def index

  end

  def changes
    if params[:search]
      @changes = Audited::Adapters::ActiveRecord::Audit.all.order("created_at DESC")
      @products = Product.search(params[:search], :title).order("created_at DESC")
      @changes.select{|x| @products.ids.include? x.auditable_id and x.user_id.present?}
    end
  end

  def low
    @products = Product.inventory_under(10)
  end

  def on_hand
    @total = 0
    @warehouse = 0
    @cotswold = 0
    @bdbox = 0
    @blacklion = 0

    @products = Product.all
    @products.each do |product|
      @total += product.total_inventory
      @warehouse += product.warehouse_inventory
      @cotswold += product.cotswold_inventory
      @bdbox += product.bdbox_inventory
      @blacklion += product.blacklion_inventory
    end
  end

  def value
    @cost = 0
    @wholesale = 0
    @retail = 0

    @products = Product.all
    @products.each do |product|
      @cost += product.cost
      @wholesale += product.wholesale
      @retail += product.retail
    end
  end

  def turnover
    if params[:search]
      @start_date = build_date_from_params("start_date", params[:report])
      @end_date = build_date_from_params("end_date", params[:report])
      @products = Product.search(params[:search], :title).order("created_at DESC")
      @products = @products.select{|x| x.turnover(@start_date, @end_date) > 0}
    else

    end
  end

  private

  def build_date_from_params(field_name, params)
    Date.new(params["#{field_name.to_s}(1i)"].to_i,
             params["#{field_name.to_s}(2i)"].to_i,
             params["#{field_name.to_s}(3i)"].to_i)
  end

  def require_admin
    unless current_user.try(:admin?)
      flash[:alert] = "You must be an admin user to perform that action"
      redirect_to "/"
    end
  end
end
