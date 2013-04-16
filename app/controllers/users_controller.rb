class UsersController < ApplicationController
  def new
  @user = User.new
  end

  def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to(log_in_path)#, :notice => "Signed up!"
	  else
	    render "new"
	  end
   end

   def addusers
    checkuser
    @userview=User.new

    @friendsadded=Friends.where(:userid => session[:user_id])
   # @userview=User.where("id not in (?)",  session[:user_id])
    #@userview=User.find_by_sql("id not in (?)", @friendsadded)
    @userview=User.find_by_sql ["select * from Users where  id <>? and id not in (select friendid from friends where userid=?)",session[:user_id],session[:user_id]]

    showfriends
   end

   def addfriends
    checkuser
   
    params[:friends].each do |friend|
    @friend=Friends.create :userid => session[:user_id], :friendid => friend
    end
    if @friend.save
      redirect_to(user_add_path)
    else
      user_add
    end
  

   end

   def chat
    checkuser
   
       @userview=User.find_by_sql ["select * from Users where  id <>?",session[:user_id]]

   end

   def chatwindow

      #render :layout => false
   end

   def showfriends
    checkuser
   
      @showfriends= User.find_by_sql ["select email from Users where  id <>? and id in (select friendid from friends where userid=?)",session[:user_id],session[:user_id]]

   end


   def myfriends
    checkuser
   
      @myfriends= User.find_by_sql ["select id,email from Users where  id in (select userid from friends where friendid=?)",session[:user_id]]

   end

   

   def blog
    checkuser
  	@blog = Blog.new
   end

   def blogview
     checkuser
     if params[:user_id].nil?

        cuserid = session[:user_id]
    else

        cuserid =params[:user_id] 
     end   

      @blogview= Blog.where(:userid =>cuserid)     

      myfriends
    end  

def friendsblogview
     checkuser
    
      cuserid =params[:user_id] 
    
      @fblogview= Blog.where(:userid =>cuserid)     

      myfriends
      render :layout => false

    end  


   def blogcreate
    checkuser
 	   	@userid= session[:user_id]
	  	@title=params[:title]
	  	@post=params[:post]
       @blog=Blog.create :userid => @userid, :title => @title, :post => @post

       if @blog.save
       
       	redirect_to(blog_view_path)
       else
	    render "blog"
	  end

    
   
   end

   def checkuser
      if session[:user_id] == nil
          redirect_to(log_in_path)
      end
   end

end
