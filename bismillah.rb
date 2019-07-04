class GameAcakKata
  def new_game(random_word, max_attempt)
    result = false
    attempt = 0

    until result == true or attempt == max_attempt
      attempt += 1
      print "Jawab: "
      word_answer = gets.chomp
      result = valid_word?(random_word, word_answer)
      puts "Salah, ayo coba lagi! :D" if !result
    end

    return result
  end

  def random_library
    [
      ["a", "b", "t", "r", "e", "i", "k"],
      ["r", "b", "u", "a", "g", "t", "e", "s"],
      ["j", "r", "a", "e", "n", "i", "t"],
      # ["e", "a", "i", "d", "a", "r", "t", "n", "p"],
      # ["a", "a", "l", "m", "s", "t", "r", "e"],
      # ["m", "a", "e", "t", "r", "l", "a"],
      # ["a", "u", "t", "e", "k", "t", "r"],
      # ["l", "a", "m", "e", "r", "h", "t", "e"],
      # ["t", "t", "e", "o", "r", "o", "r", "k"],
      # ["s", "t", "e", "h", "i", "e", "r", "r", "b"],
      # ["t", "e", "e", "r", "c", "t", "a", "p"],
      # ["i", "n", "k", "t", "c", "t", "a", "e"],
      # ["g", "n", "t", "t", "r", "e", "g", "a", "e", "n"],
      # ["e", "j", "e", "t", "r", "l", "k", "e"],
      # ["c", "u", "u", "r", "e", "l", "t"],
      # ["r", "e", "j", "a", "i", "t", "n", "k"],
      # ["t", "a", "e", "r", "l", "i", "r"],
      # ["e", "r", "u", "s", "t", "a", "b"],
      # ["t", "r", "e", "a", "a", "g", "n", "s"],
      # ["e", "n", "a", "r", "p", "a", "t", "s"],
      # ["e", "n", "d", "t", "r", "i", "g", "n", "i"]
    ]
  end

  def valid_word?(random_word, word_answer)
    word_answer
    .each_char
    .all? { |ch| random_word.delete_at(random_word.index(ch)) rescue nil }

    # word_answer.each_char do |answer|
    #   random_word.delete(random_word)
    # end
  end
end

result = false
point = 0
attempt = 0

play = GameAcakKata.new
puts "Hallo, berikut adalah permainan tebak kata sifat jadian, yaitu kata yang terbentuk dari imbuhan ter – yang bermakna paling."
# until attempt.is_a?Numeric and attempt > 0
# end
print "Berapa banyak soal yang kamu ingin coba? "
attempt = gets.chomp.to_i

attempt.times do |index|
  print "\n\n #{index+1}. Berapa banyak batas percobaan yang ingin kamu lakukan pada soal ini? "
  attempt = gets.chomp

  random_word = play.random_library.sample
  puts "Kata sifat: #{random_word.join}"

  if x = play.new_game(random_word, attempt.to_i)
    point += 1
    puts "Yey, berhasil! point kamu bertambah menjadi #{point}"
  else
    puts "Yahhh, sayang sekali! point kamu tidak bertambah"
  end

end

puts "Selesai, point kamu #{point}"
