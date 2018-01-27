class MessagesController < ApplicationController
before_action :correct_user

def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.order(created_at: :desc)
    @messages = current_user.messages.order(updated_at: :desc)
    senders_respondents = @messages.map(&:sender_id) + @messages.map(&:respondent_id)

      @users = senders_respondents.uniq.map do |sender|
          User.where(id: sender).first
      end
    
 @opponent = params[:opponent_id]
 @message = current_user.outboxes.build
end

def show
  
  @message = @user.outboxes.build
  @opponent = User.find(params[:opp_id])
  @messages = talking(@user, @opponent)

  @messages.each do |message|
    if message.user_id == @user.id
    Message.find(message.id).update_attributes(read: true)
    end
  end

  render layout: false
  respond_to do |format|
    format.html { redirect_to root_path }
    format.js
  end
  

end
 

  def new
    @message = @user.outboxes.build    
  end


  def create
    @opponent = User.find(params[:message][:respondent_id])
    @message1 = current_user.outboxes.create(message_params)
    
    @message1.update_attributes(read: true)

    params[:message][:user_id] = params[:message][:respondent_id]
    @message2 = current_user.outboxes.create(message_params)

    respond_to do |format|
      format.js
    end

    # redirect_to after_delete_path(current_user, @message1.opponent)

  end

  def destroy
    
    @message = @user.messages.find(params[:id])
    @opponent = User.find(@message.opponent)
    
    

    if @message.destroy!
        @count = @user.messages.where(sender_id: @message.opponent).count
        respond_to do |format|
          format.js
        end
      else
      
      respond_to do |format|
        format.json { render json: "unsuccess"}
      end
    end
  end

private
  
  def correct_user
    @user = User.find(params[:user_id])
    unless current_user?(@user)
    flash[:error] = "You can not modify another user"
    redirect_to root_path
    end
  end

  
  def talking(user_1, user_2)
    sum = user_1.inboxes.where(sender_id: user_2.id).ids + user_1.outboxes.where(respondent_id: user_2.id).ids + user_2.inboxes.where(sender_id: user_1.id).ids + user_2.outboxes.where(respondent_id: user_1.id).ids
    return Message.where("id IN (?)", sum).uniq
  end


  def message_params
    params.require(:message).permit(:body, :respondent_id, :user_id)    
  end

end
