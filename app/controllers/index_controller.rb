
get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

def distinct_letters?(input)
  letter_array = input.chars
  unique_letters = letter_array.to_a.uniq
  if unique_letters.length < letter_array.length
    false
  else
    true
  end
end
