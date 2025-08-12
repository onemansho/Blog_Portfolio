class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies, reject_if:
   lambda{|attrs| attrs['name'].blank?}
  include Placeholder
 validates_presence_of :title, :subtitle, :body, :main_image,:thumb_image

 def self.angular
  where(subtitle:"Angular")
 end

 def self.by_position
     order("position ASC")
 end
 
 scope :ruby_on_rails_protfolio_items, ->{where(subtitle: 'Ruby on Rails')}
 
 after_initialize :set_default

 def set_default
  self.main_image ||=Placeholder.image_generator(height: '400',width: '150')
  self.thumb_image ||=Placeholder.image_generator(height: '400',width:'150' )

 end
 
end
