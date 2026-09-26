task_number1 = { title: 'Купить ноутбук', done: false }
task_number2 = { title: 'Сменить тариф ИП', done: false }
task_number3 = { title: 'Купить маме телефон', done: false }
task_number4 = { title: 'Написать продовцу и забронировать телефон с ноутбуком', done: false }

tasks = [task_number1, task_number2, task_number3, task_number4]

def print_tasks(tasks)
  tasks.each do |task|
    if task[:done]
      puts "[x]: #{task[:title]}"
    else
      puts "[ ]: #{task[:title]}"
    end
  end
end

def count_open(tasks)
  count = 0
  tasks.each do |task|
    count += 1 if task[:done] == false
  end
  count
end

def mark_done(tasks, title)
  tasks.each do |task|
    if task[:title] == title
      task[:done] = true
      return tasks
    end
  end
  puts 'Задача не найдена'
end

def add_task(tasks, title)
  tasks << { title: title, done: false }
  tasks
end

# #Main_code
print_tasks(tasks)
puts 'Новая задача: '
name = gets.chomp
add_task(tasks, name)
mark_done(tasks, 'Сменить тариф ИП')

lines = []
tasks.each do |task|
  lines << if task[:done]
             "[x] #{task[:title]}"
           else
             "[ ] #{task[:title]}"
           end
end

lines << "Открытых задач: #{count_open(tasks)}"

text = lines.join("\n")
puts text
File.write('todo.txt', text)
