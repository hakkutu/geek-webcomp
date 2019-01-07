class CdFavorite < ApplicationRecord
	belong_to :cds
	belong_to :user
end
