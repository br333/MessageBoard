class MessagesController < ApplicationController
before_action :find_messages, only: [:show, :edit, :update, :destroy]
def index
 @message = Message.all
end

def new
  @message = Message.new
end

def show

end

def edit

end

def destroy
  @message.destroy
    redirect_to root_path
end

def update
  if @message.update(message_params)
    redirect_to message_path
  else
    render 'edit'
  end
end

def create
  @message = Message.new(message_params)
  if @message.save
    redirect_to root_path
  else
    render 'new'
  end
end

private
 def message_params
   params.require(:message).permit(:title, :description)
 end

 def find_messages
   @message = Message.find(params[:id])
 end
end
