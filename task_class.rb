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
end

tasks = []

tasks << first_task = Task.new('Покушать')
tasks << Task.new('Поспать')
tasks << Task.new('Жить')

tasks.each do |task|
  puts task.label
end

puts '-----------------------'

first_task.complete

tasks.each do |task|
  puts task.label
end
