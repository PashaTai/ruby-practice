task_number_1 = { title: "Купить ноутбук", done: false}
task_number_2 = { title: "Сменить тариф ИП", done: false}
task_number_3 = { title: "Купить маме телефон", done: false}
task_number_4 = { title: "Написать продовцу и забронировать телефон с ноутбуком", done: false}

tasks = [task_number_1, task_number_2, task_number_3, task_number_4]

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
        if task[:done] == false
            count += 1
        end
    end
    return count
end

def mark_done(tasks, title)
    tasks.each do |task|
        if task[:title] == title
            task[:done] = true
            return tasks
        end
    end
    puts "Задача не найдена"
end

def add_task(tasks, title)
    tasks << {title: title, done: false}
    return tasks
end





##Main_code
print_tasks(tasks)
puts "Новая задача: "
name = gets.chomp
add_task(tasks, name)
mark_done(tasks, "Сменить тариф ИП")

lines = []
tasks.each do |task|
    if task[:done]
        lines << "[x] #{task[:title]}"
    else
    lines << "[ ] #{task[:title]}"
    end
end

lines << "Открытых задач: #{count_open(tasks)}"

text = lines.join("\n")
puts text
File.write("todo.txt", text)
