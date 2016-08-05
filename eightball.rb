
Key_word_answers = {
	when: ['january', 'february', 'march', 'april', 'may'],
	why: ['I ate it', 'You lost it.', 'He is your husband.'],
	what: ['cherries', 'apples', 'an elephant', 'the milky way'],
	who: ['the POTUS', 'the G.O.A.T.', 'your neighbor', 'me'],
	many: ['12', '15', 'infite', 'less than you are hoping', 'more than you make'],
	where: ['Denver', 'the center of the Earth', 'the moon', 'under your desk'],
	how: ['with a screwdriver', 'grit, sweat, and tears', 'not gonna happen'],
	unicorn: ['You bring the fairy dust, I\'ll get us some unicorns.'],
	garbage: ['Garbage shouldn\'t be discussed in polite company.'],
	water: ['Since you mentioned water, I am sort of thirsty'],
	tea: ['How should I know? Do I drink tea?'],
	pokemon: ['I wish I had a phone to play that game.'],
	donald: ['That guy is a lunatic, Hillary is no better'],
	trump: ['I am tired of politics'],
	hillary: ['I would prefer that she left the country. Can she take Trump with her?'],
}

@yes_no_answers = [
	'no, but it would be funny to watch', 'sure',
	'You most certainly can!', 'Chances are slim, but you are lucky',
	'I am tired of questions'	
]
@old_question_storage = []

def user_questions
	puts '----------------------------------'
	puts 'Enter your question'
	user_input = gets.strip.downcase
	validate_eight_words(user_input)
	split = user_input.split(' ').map(&:to_sym)
	key_array = split & Key_word_answers.keys
	key_array[1] == :many ? (key = key_array[1]) : (key = key_array[0])
	if key_array.length > 0 
		puts Key_word_answers[key.to_sym].sample
	else
		puts @yes_no_answers.sample
	end
	user_questions
end

def greeting
	puts "---Welcome to the Magic 8 Ball!---"
end

def validate_eight_words(user_response)
	user_response_array = []
	user_response_array = user_response.split(' ')
	if user_response_array.count == 8
		add_answer(user_response_array)
	else
		nil
	end
end

def add_answer(eight_words)
	if @old_question_storage.include? eight_words.last
		puts 'This should do nothing'
	else
		puts 'Congratulations!  Your question allows you to add an answer!'
		print 'Type it here:'
		user_answer = gets.strip
		@yes_no_answers.push(user_answer)
		@old_question_storage.push(eight_words.pop)
		user_questions
	end
end

greeting
user_questions