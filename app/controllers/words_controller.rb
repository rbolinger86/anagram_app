get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  erb :"/words/new"
end

post '/words' do
  puts params.inspect
  word = Word.create(text: params[:text])
  redirect "/words/#{word.id}"
end

get '/words/:id' do
  @word = Word.find(params[:id])
  erb :"/words/show"
end
