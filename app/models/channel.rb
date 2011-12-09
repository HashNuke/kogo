class Channel < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
end
