require './Aluno.rb'
require 'singleton'
require './EmailGenerator.rb'

class AlunosManager

	include Singleton

	attr_accessor :alunos

	def pode_criar_uffmail? (matricula)
		al = @alunos.find{ |a| a.matricula == matricula } # variável al recebe o aluno com a matrícula buscada
		return !(al.nil?) && al.estaAtivo && !(al.uffmail.include? '@id.uff.br') 
	end

	def gerar_opcoes_de_uffmail(matricula)
		al = @alunos.find{ |a| a.matricula == matricula }
		emailGenerator = EmailGenerator.new
		return emailGenerator.gerar_email(al.nome)
	end

	def adicionar_uffmail(matricula , uffmail)
		@alunos.each_index { |index| 
 			@alunos[index].uffmail = uffmail if @alunos[index].matricula == matricula
		 }
	end

	def busca_aluno (matricula)
		@alunos.each{ |al|
			return al if al.matricula == matricula
		}
		return nil
	end

end