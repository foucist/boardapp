class StatusesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @statuses = User.all.map {|x| x.statuses.first}.compact
  end

  def new
    @status = Status.new
  end

  def create
    @status = current_user.statuses.new(params[:status])

    respond_to do |format|
      if @status.save
        format.html { redirect_to(statuses_path, :notice => 'Status was successfully created.') }
        format.js { render :partial => @status }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
