class Aluno
 
	attr_accessor :nome, :matricula, :telefone, :email, :uffmail, :status

	def initialize(nome, matricula, telefone, email, uffmail, status)
		@nome = nome
		@matricula = matricula
		@telefone = telefone
		@email = email
		@uffmail = uffmail
		@status = status
	end

	def to_s
		return "Nome : #{@nome} , Matricula: #{@matricula} , Telefone: #{@telefone} , Email: #{@email} , Uffmail: #{@uffmail} , Status: #{@status}"
	end

	def to_csv
		return "#{@nome},#{@matricula},#{@telefone},#{@email},#{@uffmail},#{@status}"
	end

end