require './Aluno.rb'
require 'singleton'

class AlunosManager
	include Singleton

	attr_accessor :alunos

	def pode_criar_uffmail? (matricula)
		# variável al recebe o aluno com a matrícula buscada
		al = @alunos.find{ |a| a.matricula == matricula }
		if !(al.nil?) && al.status == "Ativo" && !(al.uffmail.include? "@id.uff.br")
			return true
		else
			return false
		end
	end

	def gerar_opcoes_de_uffmail(matricula)
		al = @alunos.find{ |a| a.matricula == matricula }
		opcoes = []
		nome = al.nome.split(/ /)
		random = rand(999).to_s
		opcoes << "#{nome.first.downcase}_#{nome.last.downcase}_#{random}@id.uff.br" 
		random = rand(999).to_s
		opcoes << "#{nome.last.downcase}_#{nome.first.downcase}_#{random}@id.uff.br"
		random = rand(999).to_s
		opcoes << "#{random}_#{nome.last.downcase}_#{nome.first.downcase}@id.uff.br"
		return opcoes
	end

	def adicionarUffMail(matricula , uffmail)
		@alunos.each_index { |index| 
 			if (@alunos[index].matricula == matricula)
 				@alunos[index].uffmail = uffmail
 				puts "A criação de seu e-mail (#{uffmail}) será feita nos próximos minutos."
 			end
		 }
	end

end