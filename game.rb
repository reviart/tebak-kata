# frozen_string_literal: true

class RandomWordGame
  attr_accessor :random_word, :max_attempt, :result, :point, :level

  def initialize(random_word, max_attempt, point, level)
    @result = result
    @max_attempt = max_attempt
    @random_word = random_word
    @point = point
    @level = level
  end

  def new_game
    attempt = 0

    until (@result == true) || (attempt == @max_attempt)
      attempt += 1
      print 'Jawab: '
      answer_word = gets.chomp
      @result = valid_word?(@random_word, answer_word)
      puts 'Salah, ayo coba lagi! :D' unless @result
    end

    if @result
      @point = player_point
      @level = player_level if @point == 4 || @point == 7 || @point == 11
    else
      puts 'Yahhh, kesempatan kamu habis! point tidak bertambah'
    end

    [@point, @level]
  end

  def valid_word?(random_word, answer_word)
    if random_word.length == answer_word.length
      answer_word.each_char do |word|
        random_word.delete_at(random_word.index(word))
      rescue
        return false
      end

      true
    end
  end

  def player_point
    @point += case @point
              when 0..3
                1
              when 4..6
                2
              else
                3
              end
    puts "Yey, berhasil! point kamu bertambah menjadi #{@point}"

    @point
  end

  def player_level
    @level =  case @point
              when 4
                "Medium"
              when 8
                "Hard"
              end
    puts "Selamat kamu berhasil naik menjadi level #{@level}"

    @level
  end
end

# ---------------------------------

point = 0
level = 'Beginner'

libraries = [
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
  %w[e n a r p a t s]
]

puts 'Hallo, berikut adalah permainan tebak kata sifat jadian, yaitu kata yang terbentuk dari imbuhan ter – yang bermakna paling.'
print 'Berapa banyak soal yang kamu ingin coba? '
n_question = gets.chomp.to_i

n_question.times do |index|
  random_word = libraries.sample

  print "\n#{index + 1}. Berapa banyak kesempatan yang ingin kamu coba pada soal ini? "
  max_attempt = gets.chomp.to_i
  puts "Kata sifat: #{random_word.join}"

  game = RandomWordGame.new(random_word, max_attempt, point, level)
  point, level = game.new_game
end

puts "\nSelesai, point kamu #{point}, dan kamu berada pada level #{level}"
