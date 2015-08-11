json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email

  json.vocab @user.vocabs.all do |vocab|
    json.id vocab.id
    json.dict_entry vocab.dict_entry
    json.part_of_speech vocab.part_of_speech
    json.definition vocab.definition
  end
end
