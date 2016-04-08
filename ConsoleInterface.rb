	require './AlunosManager.rb'

	class ConsoleInterface

		def apresentar_menu_principal
			resp = nil
			while resp != "exit"
				puts "Digite a matrícula para criar o UFFMAIL"
				puts "Digite 'imprimir' para exibir todos os alunos"
				puts "ou digite 'exit' para sair"
				resp = gets.chomp.downcase

				if resp == "exit"
					return nil
				elsif resp == "imprimir"
					imprimir_todos_os_alunos
				else
					if (AlunosManager.instance.pode_criar_uffmail?(resp))
						opcoes = AlunosManager.instance.gerar_opcoes_de_uffmail(resp)
						puts "Escolha uma das opções de UFFMAIL"
						opcoes.length.times { |opcao|
							puts "#{opcao + 1} - #{opcoes[opcao]} "
						}
						escolha = gets.chomp.to_i - 1
						AlunosManager.instance.adicionarUffMail(resp , opcoes[escolha])
					else
						puts "Este aluno não pode criar um uffmail"
					end
				end
			end
		end



		def imprimir_todos_os_alunos
			puts " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
			AlunosManager.instance.alunos.each { |aluno|
				puts aluno.to_s
			}
			puts " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
		end


	end