class App::PractitionersController < App::BaseController
  layout "admin"
  before_action :set_practitioner, only: [:show, :edit, :update, :destroy]

  def index
    @practitioners = current_business.practitioners.all
  end

  def show
  end

  def new
    @practitioner = current_business.practitioners.new
  end

  def edit
  end

  def create
    @practitioner = current_business.practitioners.new(practitioner_params)

    if @practitioner.save
      redirect_to practitioner_params,
                  notice: 'Practitioner was successfully created.'
    else
      render :new
    end
  end

  def update
    if @practitioner.update(practitioner_params)
      redirect_to app_practitioners_path,
                  notice: 'Practitioner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @practitioner.destroy
    redirect_to app_practitioners_path,
                notice: 'Practitioner was successfully destroyed.'
  end

  private
    def set_practitioner
      @practitioner = current_business.practitioners.find(params[:id])
    end

    def practitioner_params
      params.require(:practitioner).permit(:first_name, :last_name, :profession, :avatar, :registration, :summary)
    end
end
