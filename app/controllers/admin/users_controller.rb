class Admin::UsersController < AdminController

  def index
    @users = User.all
  end
  
  def promote
    
  end
  
  def demote
    
  end
end
