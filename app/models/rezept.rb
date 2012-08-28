# == Schema Information
#
# Table name: rezepts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  zutaten     :text
#  zubereitung :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rezept < ActiveRecord::Base
  attr_accessible :title, :zubereitung, :zutaten
  #validates_presence_of :title, :zubereitung, :zutaten
  #attr_accessible :content
  
  belongs_to :user
  
 # validates :content, presence:true, length: { maximum: 50 }
  
 
  
end
