require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/Word")
require('./lib/definition')
get('/') do
  @new_words = Word.all()
  erb(:index)
end

get('/wordform') do
  erb(:wordform)
end

get('/definitionform') do
  @meaning = Word.all()
  erb(:definitionform)
end

get('/wordbank') do
  @new_word = Word.all()
  erb(:wordbank)
end



post('/get_word') do
  entry = params.fetch('entry')
  Word.new(entry).save()
  @new_word = Word.all()
  erb(:definitionform)
end

post('/new_definition') do
  word = params.fetch('word')
  definition = params.fetch('answer')
  Definition.new(word, definition).save()
  @new_word = Word.all()
  erb(:wordbank)
end
