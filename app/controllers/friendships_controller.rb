class FriendshipsController < ApplicationController
  def create
    current_user.friendships.build(friend_id: User.find(params[:friend]).try(:id))
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "There was something wrong"
    end

    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Unfollowed sucessfuly!!!"
    redirect_to my_friends_path
  end
end
