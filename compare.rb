require 'benchmark'

def delete_recursion(s, target_char)
	delete_char = target_char * 2
	return s unless s.include? delete_char
	delete_recursion(s.gsub(delete_char, target_char), target_char)
end

def delete_recursion_2(s, target_char, delete_char)
	return s unless s.include? delete_char
	delete_recursion_2(s.gsub(delete_char, target_char), target_char, delete_char)
end

def delete_normal(s, target_char)
	delete_char = target_char * 2
	while s.include? delete_char do
		s = s.gsub(delete_char, target_char)
	end
	s
end

def delete_normal_2(s, target_char, delete_char)
	while s.include? delete_char do
		s = s.gsub(delete_char, target_char)
	end
	s
end

test_char = '。'
test_sentence = test_char * 10000000

Benchmark.bm 10 do |r|
	r.report 'recursion' do
		delete_recursion(test_sentence, test_char)
	end
	r.report 'recursion_2' do
		delete_recursion_2(test_sentence, test_char, test_char*2)
	end
	r.report 'normal' do
		delete_normal(test_sentence, test_char)
	end
	r.report 'normal_2' do
		delete_normal_2(test_sentence, test_char, test_char*2)
	end
end
