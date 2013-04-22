class StatusesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @statuses = User.all.map {|x| x.statuses.last}.compact
  end

  def new
    @status = Status.new
  end

  def create
    params[:status][:entry] = params[:commit] if Status.list.include?(params[:commit])
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
