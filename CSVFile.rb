require './Aluno.rb'
require './AlunosManager.rb'

class CSVFile


	def le_alunos(nomeDoArquivo)
		file = File.new(nomeDoArquivo, "r")
		
		alunos = []

		#pulando a primeira linha, que contém somente o cabeçalho
		line = file.gets 
		
		while (line = file.gets)
			splittedline = line.split(/,/)
			splittedline[5] = splittedline[5].downcase
			if splittedline[5].include? 'inativo' 
				estaAtivo = false  
			else
				estaAtivo = true
			end
			al = Aluno.new(splittedline[0], splittedline[1], splittedline[2], splittedline[3], splittedline[4], estaAtivo)
			alunos.push(al)
		end
		file.close
		return alunos
	end



	def salva_alunos(nomeDoArquivo)
		file = File.new(nomeDoArquivo, "w")

		#escrevendo a linha de cabeçalho
		line = file.puts "nome,matricula,telefone,email,uffmail,status" 

		AlunosManager.instance.alunos.each{ |al|
			file.puts al.to_csv
		}
		file.close
	end

end