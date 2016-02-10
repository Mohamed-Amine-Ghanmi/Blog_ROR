class Comment < ActiveRecord::Base
  has_many :notifications, as: :notifiable, dependent: :destroy 
   # as: :notifiable -> this is for polymorphic,
  belongs_to :post
  belongs_to :visitor

  def self.matching_fullname_or_message params
  	joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%","%#{params}%")
  end

end

