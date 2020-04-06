class Admin::ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    id = request.params['id']
    @club = Club.find(id)
  end

  def create
    club_attr = initialize_club(request)
    @club = Club.new(club_attr)
    @club.save!

    notice = if @club
               "Club created successfully."
             else
               "There was an error while creating the Club."
             end
    flash[:notice] = notice
    redirect_to index
  end

  def edit
    params = request[:params]
    @club = Club.find(params[:id])
    @club = update_attributes(params)
    @club.save!
  end

  def delete
    params = request[:params]
    @club = Club.find(params[:id])
    @club = update_attributes(status: Club.STATUS['DELETED'])
    @club.save!
    redirect_to :index
  end

  def permitted_params(params)
    params = ActionController::Parameters.new(params)
    params.permit('name', 'description', 'status')
  end

  private

  def initialize_club(request)
    params = permitted_params(request.params)
    slug = params.fetch('name').parameterize
    url = request.origin + "/#{ slug }"
    {
      name: params.fetch('name'),
      description: params.fetch('description'),
      status: params.fetch('status', 0),
      url: url,
      invitation_link: ShortURL.shorten(url, :tinyurl)
    }
  end
end

