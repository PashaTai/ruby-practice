class Task
    def initialize(title)
        @title = title
        @done = false
    end

    def label
        if @done == false
            return "[ ] #{@title}"
        end
        return "[x] #{@title}"
    end

    def complete
        @done = true
    end

    def uncomplete
        @done = false
    end

    def title
        return "#{@title}"
    end

    def done?
        if @done == false
            return "0"
        end
        return "1"
    end
end

def save_tasks(tasks, path)
    lines = []
    tasks.each do |task|
        lines << "#{task.title}|#{task.done?}"
    end
    text = lines.join("\n")
    File.write(path, text)
end

def load_tasks(path)
    tasks = []
    if File.exist?(path) == false
        return []
    end
    file = File.read(path)
    file.each_line do |line|
        parts = line.chomp.split("|", 2)
        tasks << task = Task.new(parts[0])
        if parts[1] == "1"
            task.complete
        end
    end
    return tasks
end

tasks = load_tasks("todo_data.txt")

loop do
    puts "1 — показать список"
    puts "2 — добавить задачу"
    puts "3 — отметить выполненной"
    puts "0 — выход"
    choice = gets.chomp

    if choice == "1" && tasks.empty?
        puts "пусто"
    elsif choice == "1"
        tasks.each do |task|
            puts task.label
        end
    elsif choice == "2"
        puts "Название задачи?"
        task_title = gets.chomp
        tasks << Task.new(task_title)
        save_tasks(tasks,"todo_data.txt")
        puts "Добавлено"
    elsif choice == "3"
        tasks.each_with_index do |task, i|
            puts "#{i+1}. #{task.label}"
        end
        puts "Введите номер задачи"
        index_of_task = gets.chomp.to_i
        if index_of_task < 1 || index_of_task > tasks.length
            puts "Нет такой задачи"
        else
            tasks[index_of_task - 1].complete
            save_tasks(tasks, "todo_data.txt")
            puts "Отмечено"
        end
    elsif choice == "0"
        break
    end
end

