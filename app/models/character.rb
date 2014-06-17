class Character < ActiveRecord::Base
  belongs_to :television_show
  validates :character_name, presence: true
  validates :actor_name, presence: true
end
