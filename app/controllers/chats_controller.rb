class ChatsController < ApplicationController

def get_messages
    c = Chat.all.first
    m = c.messages.reverse
    render json: c.messages
end

def submit_message
    c = Chat.all.first
    temp = c.messages
    obj = {
        author: params[:user],
        message: params[:message]
    }
    temp.push(obj);
    c.update(messages: temp)
    c.save
    render json: ["logged"]
end

end
