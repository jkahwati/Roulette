class Player < ApplicationRecord


	def initialize(attributes = {})  #Inicializando el campo CANTIDAD en 10.000
		attr_with_defaults = { :cantidad => 10000 }.merge(attributes)
		super(attr_with_defaults)
	end



	def showMessage 
		
			puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	
	end





end
