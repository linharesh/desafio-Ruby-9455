class Aluno
 
	attr_accessor :nome, :matricula, :telefone, :email, :uffmail, :estaAtivo

	def initialize(nome, matricula, telefone, email, uffmail, estaAtivo)
		@nome = nome
		@matricula = matricula
		@telefone = telefone
		@email = email
		@uffmail = uffmail
		@estaAtivo = estaAtivo
	end

	def to_s
		@estaAtivo ? status = 'Ativo' : status = 'Inativo'
		return "Nome : #{@nome} , Matricula: #{@matricula} , Telefone: #{@telefone} , Email: #{@email} , Uffmail: #{@uffmail} , Status: #{status}"
	end

	def to_csv
		@estaAtivo ? status = 'Ativo' : status = 'Inativo'
		return "#{@nome},#{@matricula},#{@telefone},#{@email},#{@uffmail},#{status}"
	end

end