class GameAcakKata
  def new_game(random_word, max_attempt)
    result = false
    attempt = 0

    until (result == true) || (attempt == max_attempt)
      attempt += 1
      print 'Jawab: '
      word_answer = gets.chomp
      result = valid_word?(random_word, word_answer)
      puts 'Salah, ayo coba lagi! :D' unless result
    end

    result
  end

  def random_library
    [
      %w[a b t r e i k],
      %w[r b u a g t e s],
      %w[j r a e n i t],
      %w[e a i d a r t n p],
      %w[a a l m s t r e],
      %w[m a e t r l a],
      %w[a u t e k t r],
      %w[l a m e r h t e],
      %w[t t e o r o r k],
      %w[s t e h i e r r b],
      %w[t e e r c t a p],
      %w[i n k t c t a e],
      %w[g n t t r e g a e n],
      %w[e j e t r l k e],
      %w[c u u r e l t],
      %w[r e j a i t n k],
      %w[t a e r l i r],
      %w[e r u s t a b],
      %w[t r e a a g n s],
      %w[e n a r p a t s],
      %w[e n d t r i g n i]
    ]
  end

  def valid_word?(random_word, word_answer)
    if random_word.length == word_answer.length
      word_answer.each_char do |word|
        random_word.delete_at(random_word.index(word))
      end

      true
    end
  end
end

# initialized
result = false
point = 0

play = GameAcakKata.new

puts 'Hallo, berikut adalah permainan tebak kata sifat jadian, yaitu kata yang terbentuk dari imbuhan ter – yang bermakna paling.'
print 'Berapa banyak soal yang kamu ingin coba? '
n_question = gets.chomp.to_i

n_question.times do |index|
  print "\n#{index + 1}. Berapa banyak batas percobaan yang ingin kamu lakukan pada soal ini? "
  attempt = gets.chomp

  random_word = play.random_library.sample
  puts "Kata sifat: #{random_word.join}"

  if play.new_game(random_word, attempt.to_i)
    point += 1
    puts "Yey, berhasil! point kamu bertambah menjadi #{point}"
  else
    puts 'Yahhh, sayang sekali! point kamu tidak bertambah'
  end
end

puts "\nSelesai, point kamu #{point}"
