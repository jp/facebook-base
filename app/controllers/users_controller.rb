class UsersController < ApplicationController
  before_filter :require_authentication

=begin apidoc
url:: /user
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON|XML] - User details

 Display the details of the user object in database
=end
  def details
  	@user = FacebookAccount.find_by_fb_id( current_user.identifier ).user
    respond_to do |format|
			format.xml  { render :xml => @user.to_xml(:only => [ :name, :location, :positionInGame,:email]) }
			format.json  { render :json => @user.to_json(:only => [ :name, :location, :positionInGame,:email])	}
		end
  end


=begin apidoc
url:: /user/friends
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON|XML] - List of friends

 Retrieve the list of friends who already used the application
=end
  def friends
  	@user = FacebookAccount.find_by_fb_id( current_user.identifier ).user

    @friends = @user.friends.where("facebook_accounts.user_id IS NOT NULL")

    respond_to do |format|
	    format.xml  { render :xml => @friends.to_xml(:only => [ :user], :include => { :user  => {:only => [ :name,:positionInGame]}}) }
	    format.json  { render :json => @friends.to_json(:only => [ :user], :include => { :user  => {:only => [ :name,:positionInGame]}}) }
    end

  end


=begin apidoc
url:: /user/position
method:: GET
access:: AUTHENTICATED USERS
return:: [JSON|XML] - some project  

 Retrieve the last position of the user in the game
=end
  def updatePosition
    if params[:pos]
    	@user = FacebookAccount.find_by_fb_id( current_user.identifier ).user
      @user.positionInGame = params[:pos]
      respond_to do |format|
        if @user.save
			    format.xml  { render :xml => @user.to_xml(:only => [ :name, :location, :positionInGame]) }
			    format.json  { render :json => @user.to_json(:only => [ :name, :location, :positionInGame])	}
        end
      end
    end
  end


end
