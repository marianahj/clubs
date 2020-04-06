class Club < ApplicationRecord
  has_many :social_medias

  STATUS = { 'INACTIVE': 0, 'ACTIVE':1, 'DELETED': 2 }
end
