class Message < ApplicationRecord
belongs_to :sender, class_name: "User" 
belongs_to :respondent, class_name: "User"

def opponent
      if self.user_id == self.sender_id
        return self.respondent_id
      else
        return self.sender_id
      end
end




    
end
