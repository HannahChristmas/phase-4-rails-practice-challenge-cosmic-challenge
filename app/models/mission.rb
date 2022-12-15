class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet 

    validates :name, presence: :true 
    validates :scientist, presence: :true 
    #scope: :name refers to the mission name, not the scientist's name
    validates :scientist, uniqueness: {scope: :name}
    validates :planet, presence: :true
    
end
