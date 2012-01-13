class EventsController < ApplicationController
  before_filter :require_authentication

=begin apidoc
url:: /event/:id/attending
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON] - true/false

 The authenticated user is attending to the event
=end
  def attending
  	user = FacebookAccount.find_by_fb_id( current_user.identifier ).user
    event = FbGraph::Event.fetch(params[:id])
    result = event.attending!(:access_token => user.access_token)

    render :json => result.to_json	
  end


=begin apidoc
url:: /event/:id/maybe
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON] - true/false

 The authenticated user is maybe attending to the event
=end
  def maybe
  	user = FacebookAccount.find_by_fb_id( current_user.identifier ).user
    event = FbGraph::Event.fetch(params[:id])
    result = event.maybe!(:access_token => user.access_token)

    render :json => result.to_json	
  end


=begin apidoc
url:: /event/:id/declined
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON] - true/false

 The authenticated user has declined the invitation to the event
=end
  def declined
  	user = FacebookAccount.find_by_fb_id( current_user.identifier ).user
    event = FbGraph::Event.fetch(params[:id])
    result = event.declined!(:access_token => user.access_token)

    render :json => result.to_json	
  end


end
