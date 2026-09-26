# ============================================================
# task_persist.rb
# Кусок C: функции выше уже готовы. Меняем только MAIN внизу.
# ============================================================

# ----- ОСТАВЬ КАК ЕСТЬ: класс Task (не ломай) -----
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

# ============================================================
# MAIN — КУСОК C (перепиши этот хвост)
# Смысл: при каждом запуске сначала читаем файл.
# Если задач нет — один раз создаём стартовые руками и save.
# Если есть — руками не создаём. Печатаем → complete одной
# открытой → save → печатаем снова. Второй запуск скрипта
# должен показать те же галочки (задачи «живут» в файле).
# ============================================================

# --- СТАРЫЙ хвост от A/B (больше не нужен как основной сценарий).
# Я его закомментировал, чтобы ты видел, ЧТО убрать из «живой» части.
# Не раскомментируй обратно для куска C.
#
# tasks = []
# tasks << first_task = Task.new("Покушать")
# tasks << second_task = Task.new("Поспать")
# tasks << third_task = Task.new("Жить")
# second_task.complete
# third_task.complete
# save_tasks(tasks, "tasks_data.txt")
# tasks = load_tasks("tasks_data.txt")
# tasks.each do |task|
#   puts task.label
# end

# --- НОВЫЙ хвост: напиши код по шагам ниже (я не даю готовое решение).

# ШАГ 1. Загрузи задачи из файла в переменную tasks:
#   tasks = load_tasks("tasks_data.txt")

# ШАГ 2. Если массив пустой (tasks пустой / tasks.empty?):
#   создай 2–3 Task руками (как раньше), положи в tasks,
#   сразу вызови save_tasks(tasks, "tasks_data.txt").
#   Если массив НЕ пустой — этот блок пропускаешь, руками ничего не создаёшь.

# ШАГ 3. Напечатай все label (это блок «до»):
#   tasks.each { ... puts task.label }

# ШАГ 4. Найди ОДНУ задачу, у которой ещё не done (смотри done? == "0"
#   или label с "[ ]"), вызови у неё complete.

# ШАГ 5. Снова save_tasks(tasks, "tasks_data.txt") — записать новые галочки.

# ШАГ 6. Снова напечатай все label (блок «после»).

# Проверка: запусти ruby task_persist.rb два раза подряд.
# Второй раз галочки не должны сброситься в начало.

tasks = load_tasks("tasks_data.txt")

if tasks.empty?
    tasks << first = Task.new("Первая задача")
    tasks << second = Task.new("Вторая задача") 
    tasks << third = Task.new("Третья задача")
    save_tasks(tasks, "tasks_data.txt")
end


tasks.each do |task|
    puts task.label
end

tasks.each do |task|
    if task.done? == "0"
        task.complete
        break
    end
end

save_tasks(tasks, "tasks_data.txt")

puts "-----------------------------"

tasks.each do |task|
    puts task.label
end