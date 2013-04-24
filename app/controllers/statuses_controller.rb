class StatusesController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @statuses = User.all.map {|x| x.current_status}.sort_by(&:created_at)
  end

  def new
    @status = Status.new
  end

  def create
    # check against params[:status][:entry].empty?  is due to 'Available' getting selected when hitting enter
    params[:status][:entry] = params[:commit] if params[:status][:entry].empty? && Status.list.include?(params[:commit])
    @status = current_user.statuses.new(params[:status])

    respond_to do |format|
      if @status.save
        # hack - internet is down so i'm having trouble figuring out how to pass in user_id via coffee & actually target the proper section to update
        format.html { index; render @statuses }
        format.json  { render :json => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @status.errors.full_messages.first, :status => :unprocessable_entity }
      end
    end
  end

end
