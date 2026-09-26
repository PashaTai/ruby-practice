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

end

tasks = []

tasks << first_task = Task.new("Покушать")
tasks << second_task = Task.new("Поспать")
tasks << third_task = Task.new("Жить")

tasks.each do |task|
    puts task.label
end

puts "-----------------------"

first_task.complete

tasks.each do |task|
    puts task.label
end

