get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

post '/' do
  word = params[:word]
  if valid_input?(word)
    redirect "/anagrams/#{word}"
  else
    @error = "Sorry, your input was invalid. Please try again!"
    erb :index
  end
end

def all_letters?(input)
  letter_array = input.chars
  unique_letters = letter_array.to_s.gsub(/[^a-z]/i, '')
  if unique_letters.length < letter_array.length
    false
  else
    true
  end
end

def valid_input?(input)
  if all_letters?(input)
    true
  else
    false
  end
end
