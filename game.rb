class RandomWordGame
  attr_accessor :random_word, :max_attempt, :result

  def initialize(random_word, max_attempt)
    @result = result
    @max_attempt = max_attempt
    @random_word = random_word
  end

  def new_game
    attempt = 0
    point = 0

    until (@result == true) || (attempt == @max_attempt)
      attempt += 1
      print 'Jawab: '
      answer_word = gets.chomp
      @result = valid_word?(@random_word, answer_word)
      puts 'Salah, ayo coba lagi! :D' unless @result
    end

    if @result
      point += 1
      puts "Yey, berhasil! point kamu bertambah menjadi #{point}"
    else
      puts "Yahhh, kesempatan kamu habis! point tidak bertambah"
    end

    return point
  end

  def valid_word?(random_word, answer_word)
    if random_word.length == answer_word.length
      answer_word.each_char do |word|
        random_word.delete_at(random_word.index(word))
      end

      true
    end
  end
end

# ---------------------------------

point = 0
libraries = [
  %w[a b t r e i k],
  %w[r b u a g t e s],
  %w[j r a e n i t],
  %w[e a i d a r t n p],
  %w[a a l m s t r e],
  %w[m a e t r l a],
]

puts "Hallo, berikut adalah permainan tebak kata sifat jadian, yaitu kata yang terbentuk dari imbuhan ter – yang bermakna paling."
print "Berapa banyak soal yang kamu ingin coba? "
n_question = gets.chomp.to_i

n_question.times do |index|
  random_word = libraries.sample

  print "\n#{index + 1}. Berapa banyak kesempatan yang ingin kamu coba pada soal ini? "
  max_attempt = gets.chomp.to_i
  puts "Kata sifat: #{random_word.join}"

  game = RandomWordGame.new(random_word, max_attempt)
  point += game.new_game
end

puts "\nSelesai, point kamu #{point}"
