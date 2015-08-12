json.all_words @vocab.all do |v|
  json.id v.id
  json.dict_entry v.dict_entry
  json.part_of_speech v.part_of_speech
  json.definition v.definition
end
