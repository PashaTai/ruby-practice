class Task
  def initialize(title)
    @title = title
    @done = false
  end

  def label
    return "[ ] #{@title}" if @done == false

    "[x] #{@title}"
  end

  def complete
    @done = true
  end

  def uncomplete
    @done = false
  end

  def title
    @title.to_s
  end

  def done?
    return '0' if @done == false

    '1'
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
  return [] if File.exist?(path) == false

  file = File.read(path)
  file.each_line do |line|
    parts = line.chomp.split('|', 2)
    tasks << task = Task.new(parts[0])
    task.complete if parts[1] == '1'
  end
  tasks
end

tasks = load_tasks('todo_data.txt')

loop do
  puts '1 — показать список'
  puts '2 — добавить задачу'
  puts '3 — отметить выполненной'
  puts '0 — выход'
  choice = gets.chomp

  if choice == '1' && tasks.empty?
    puts 'пусто'
  elsif choice == '1'
    tasks.each do |task|
      puts task.label
    end
  elsif choice == '2'
    puts 'Название задачи?'
    task_title = gets.chomp
    tasks << Task.new(task_title)
    save_tasks(tasks, 'todo_data.txt')
    puts 'Добавлено'
  elsif choice == '3'
    tasks.each_with_index do |task, i|
      puts "#{i + 1}. #{task.label}"
    end
    puts 'Введите номер задачи'
    index_of_task = gets.chomp.to_i
    if index_of_task < 1 || index_of_task > tasks.length
      puts 'Нет такой задачи'
    else
      tasks[index_of_task - 1].complete
      save_tasks(tasks, 'todo_data.txt')
      puts 'Отмечено'
    end
  elsif choice == '0'
    break
  end
end
