require './ConsoleInterface.rb'
require './CSVFile.rb'
require './AlunosManager'

csv = CSVFile.new
AlunosManager.instance.alunos = csv.le_alunos('alunos.csv')

console = ConsoleInterface.new
console.apresentar_menu_principal
