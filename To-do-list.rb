







# ==========================================
# LISTA ZADAŃ DANIELA 🚀
# ==========================================

class TodoApp
  FILE_NAME = "zadania.txt"

  def initialize
    # Ładujemy zadania z pliku przy starcie, jeśli plik istnieje
    @tasks = load_tasks
  end

  def run
    loop do
      print_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then show_tasks
      when 2 then add_task
      when 3 then delete_task
      when 4 
        save_tasks
        puts "\n💎 Dane zapisane! Bajabongo, Daniel! Miłego dnia! 👋"
        brea
      else
        puts "\n❌ Coś pokręciłeś, wybierz numer od 1 do 4."
      end
    end
  end

  private

  def print_menu
    puts "\n" + "="*30
    puts "      RUBY TASK MANAGER"
    puts "="*30
    puts "1. 📋 Pokaż moje zadania"
    puts "2. ➕ Dodaj nowe zadanie"
    puts "3. 🗑️ Usuń zadanie"
    puts "4. 🚪 Wyjdź i zapisz"
    print "\nWybierz opcję: "
  end

  def show_tasks
    puts "\n--- TWOJA LISTA ---"
    if @tasks.empty?
      puts "📭 Pusto tutaj... Czas na relaks!"
    else
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def add_task
    print "\nCo masz do zrobienia? "
    task = gets.chomp.strip
    if task.empty?
      puts "❌ Nie możesz dodać pustego zadania!"
    else
      @tasks << task
      puts "✅ Dodano: #{task}"
    end
  end

  def delete_task
    show_tasks
    return if @tasks.empty?

    print "\nPodaj numer zadania do usunięcia: "
    input = gets.chomp
    
    # Sprawdzamy czy to na pewno liczba
    if input =~ /^\d+$/
      index = input.to_i - 1
      if index.between?(0, @tasks.length - 1)
        removed = @tasks.delete_at(index)
        puts "🗑️ Usunięto: #{removed}"
      else
        puts "❌ Nie ma zadania z numerem #{index + 1}!"
      end
    else
      puts "❌ Musisz podać numer!"
    end
  end

  # Funkcja zapisu do pliku .txt
  def save_tasks
    File.open(FILE_NAME, "w") do |f|
      @tasks.each { |task| f.puts(task) }
    end
  end

  # Funkcja odczytu z pliku .txt
  def load_tasks
    if File.exist?(FILE_NAME)
      File.readlines(FILE_NAME).map(&:chomp)
    else
      []
    end
  end
end

# Odpalenie maszyny
app = TodoApp.new
app.run
