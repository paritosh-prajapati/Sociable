class ProfilesController< ApplicationController
  def show
    # debugger
    @profile= User.find(params[:id])
  end
end