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

# ----- ОСТАВЬ КАК ЕСТЬ: сохранить массив Task в файл -----
def save_tasks(tasks, path)
  lines = []
  tasks.each do |task|
    lines << "#{task.title}|#{task.done?}"
  end
  text = lines.join("\n")
  File.write(path, text)
end

# ----- ОСТАВЬ КАК ЕСТЬ: прочитать файл обратно в массив Task -----
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

tasks = load_tasks('tasks_data.txt')

if tasks.empty?
  tasks << Task.new('Первая задача')
  tasks << Task.new('Вторая задача')
  tasks << Task.new('Третья задача')
  save_tasks(tasks, 'tasks_data.txt')
end

tasks.each do |task|
  puts task.label

  if task.done? == '0'
    task.complete
    break
  end
end

save_tasks(tasks, 'tasks_data.txt')

puts '-----------------------------'

tasks.each do |task|
  puts task.label
end
