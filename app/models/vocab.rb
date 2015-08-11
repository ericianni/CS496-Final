class Vocab
  include Mongoid::Document

  before_validation { self.dict_entry = dict_entry.downcase }
  before_validation { self.definition = definition.downcase }
  before_validation { self.part_of_speech = part_of_speech.downcase }
  
  validates :dict_entry, presence: true, uniqueness: true, length: { maximum: 200 }
  validates :definition, presence: true, length: { maximum: 200 }
  validates :part_of_speech, presence: true
  
  field :dict_entry, type: String
  field :definition, type: String
  field :part_of_speech, type: String
  
  index( { id: 1 } )
  
end
