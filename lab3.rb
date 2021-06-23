def task_1
  file = File.open('test.txt')
 file_data = file.read.split("\n")
 file.close
 result = []

 loop do
   puts 'Введите возраст'
   input = gets.to_i
   break if input == -1

   for student in file_data
     result.append(student) if student.split(' ')[2].to_i == input
   end
   break if file_data.length == result.length
 end

 file = File.open('result.txt', 'w')
 for s in result
   puts s
   file.write(s + "\n")
 end
 file.close
end


def deposit(balance, add_sum)
  if add_sum > 0
    puts("Вы внесли на счёт: #{add_sum}$")
    balance += add_sum
    puts("Ваш баланс: #{balance}$")
    balance
  elsif
  puts "Сумма не валидна(меньше нуля)"
  end
end
def withdraw(balance, get_sum)
  if get_sum < 0
    puts "Сумма не валидна(меньше нуля)"
  elsif balance < get_sum
    puts "У вас на счету не сдостаточно средст"
  else
    puts("Вы сняли со счёта: #{get_sum}$")
    balance -= get_sum
    puts("Ваш баланс: #{balance}$")
    balance
  end
end

def get_balance(balance)
    puts("Ваш баланс: #{balance}$")
end

def task_2

  balance = File.file?("balance.txt") ? File.read("balance.txt") : 100.0
  balance = balance.to_f

  loop do
    puts "D - внести деньги\nW - вывести деньги\nB - проверить баланс\nQ - выйти"
    x = gets.chomp
    x = x.upcase
    case x
    when "D"
      puts "Введите сумму для депозита >>"
      add_sum = gets.to_f
      balance = deposit(balance,add_sum)
    when "W"
      puts "Введите сумму для снятия со счета >>"
      get_sum = gets.to_f
      balance = withdraw(balance,get_sum)
    when "B"
      get_balance(balance)
    when "Q"
      File.write("balance.txt", balance)
      return
    else
      puts "Неизвестная команда. Вы должны выбрать пункт меню"
    end
  end
end



def menu
  loop do
    puts '============================'
    puts '1. Первое задание'
    puts '2. Банк'
    puts '0. Выход'
    puts '============================'

    choose = gets.to_i
    case choose
    when 1
      task_1
    when 2
      task_2
    else
      break
    end
  end
end

menu
