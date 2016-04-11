	require './AlunosManager.rb'

	class ConsoleInterface

		def apresentar_menu_principal
			resp = nil
			while resp != 'exit'

				puts 'Digite a matrícula para criar o UFFMAIL'
				puts 'Digite imprimir para exibir todos os alunos'
				puts 'Digite buscar -matricula- para realizar uma busca'
				puts 'Digite salvar para salvar as alteracoes no arquivo'
				puts 'ou digite exit para sair'
				resp = gets.chomp.downcase

				case resp

				when 'exit'
					return nil
				when 'imprimir'
					self.imprimir_todos_os_alunos
				when 'salvar'
					csvFile = CSVFile.new
					csvFile.salva_alunos 'alunos.csv'
					puts 'Informações gravadas com sucesso!'
				else
					if resp.include? 'buscar'
						strsplit = resp.split(/ /)
						matricula = strsplit.last
						puts "buscando #{matricula}"
						aluno = AlunosManager.instance.busca_aluno (matricula)
						if aluno.nil? # não consegui transformar esse IF em um operador ternário de FORMA ALGUMA :(
							puts 'Aluno não encontrado'
						else
							puts aluno.to_s
						end
					else
						if (AlunosManager.instance.pode_criar_uffmail?(resp))
							opcoes = AlunosManager.instance.gerar_opcoes_de_uffmail(resp)
							puts 'Escolha uma das opções de UFFMAIL'
							opcoes.length.times { |opcao| puts "#{opcao + 1} - #{opcoes[opcao]} " }
							escolha = gets.chomp.to_i - 1
							puts "A criação de seu e-mail (#{opcoes[escolha]}) será feita nos próximos minutos."
							AlunosManager.instance.adicionar_uffmail(resp , opcoes[escolha])
						else
							puts 'Este aluno não pode criar um uffmail'
						end
					end
				end

			end

		end


			def imprimir_todos_os_alunos
				puts ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'
				AlunosManager.instance.alunos.each { |aluno| puts aluno.to_s}
				puts ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'
			end


		end