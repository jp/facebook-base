class DashboardController < ApplicationController
  before_filter :require_authentication

  def show
    
    




    
    @fb_account = FacebookAccount.find_or_create_by_fb_id(current_user.identifier)
    if (!@fb_account.user)
      @user = FbGraph::User.me(current_user.access_token).fetch
      user=User.create(:access_token => current_user.access_token,:name => @user.name,:email => @user.email)
      @fb_account.name = @user.name
      @fb_account.user = user
      @fb_account.save
# This should be in a rake task in order not to slow the process
# see backgrounding rake tasks
# http://railscasts.com/episodes/127-rake-in-background
      current_user.profile.friends.each do |friend|
        
        puts friend.name
        
        friend_account = FacebookAccount.find_or_create_by_fb_id(friend.identifier)
        friend_account.name = friend.name
        friend_account.save
        
        fb_node = FacebookNode.new
        fb_node.user = @fb_account.user
        fb_node.facebook_account = friend_account
        fb_node.save
      end
    end
    

	current_user.profile.events.each do |event|

    ev = Event.find_or_create_by_fb_id(event.identifier)
    ev.name = event.name
    ev.description = event.description
    ev.location = event.location
    if event.start_time
  	  ev.start_time = event.start_time.to_time
    end
    if event.end_time
	    ev.end_time = event.end_time.to_time
    end
    if event.updated_time
  	  ev.updated_time = event.updated_time.to_time
    end

    ev.save
  end

    
    
  end

end
