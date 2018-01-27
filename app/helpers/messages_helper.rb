module MessagesHelper




def sender(message)
  User.find(message.sender_id)
end

def new_messages_count(messages, user_id)
   new_mes = messages.where("sender_id = (?) and read = (?)", user_id, false).count
   if new_mes == 0
    return
  else
    return "(" + new_mes.to_s + ")"
  end
end



end
