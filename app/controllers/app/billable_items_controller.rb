class App::BillableItemsController < App::BaseController
  before_action :set_billable_item, only: [:show, :edit, :update, :destroy]

  # GET /billable_items
  # GET /billable_items.json
  def index
    @billable_items = current_business.billable_items.all
  end

  # GET /billable_items/1
  # GET /billable_items/1.json
  def show
  end

  # GET /billable_items/new
  def new
    @billable_item = current_business.billable_items.new
  end

  # GET /billable_items/1/edit
  def edit
  end

  def create
    @billable_item = current_business.billable_items.new(billable_item_params)

    if @billable_item.save
      redirect_to app_billable_items_path,
                  notice: 'Billable item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @billable_item.update(billable_item_params)
      redirect_to app_billable_items_path,
                  notice: 'Billable item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @billable_item.destroy

    redirect_to app_billable_items_path,
                notice: 'Billable item was successfully destroyed.'
  end

  private
    def set_billable_item
      @billable_item = current_business.billable_items.find(params[:id])
    end

    def billable_item_params
      params.require(:billable_item).permit(:name, :item_number, :price, :practitioner_full_name)
    end
end
