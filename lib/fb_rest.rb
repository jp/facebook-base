module FbRest
  
  
  #
  #   fb_graph if only supporting the FB Graph API, not the deprecated REST API
  #   At this date, the Event invitation has not beed supported in the Facebook Graph API
  #   We will have to use the REST API in order to send invitation to users
  #
  
  
  class FbEvent
    def invite(event_id,user_ids,access_token)
      require 'open-uri'


      url = "https://api.facebook.com/method/events.invite?eid="+event_id.to_s+"&uids="+user_ids.to_s+"&access_token="+access_token+"&format=json"
      content = Net::HTTP.get_response(URI.parse(url))


    end
  end
end
