class Forecast < ActiveRecord::Base
	
	def self.request


		require 'nokogiri'
		require 'open-uri'
		




		api = "http://www.myweather2.com/developer/weather.ashx?uac=z1Ev2blpkG&uref=6fbacc4c-d5da-4189-b1e8-610f0b82f3b7"
		request = open(api) #Abro la api
		
		if request  #Si hace la conexion con la API
			Nokogiri::XML(request).xpath("//forecast").each do |forecast|

				date = forecast.at("date").text

				maxtemp 	= forecast.at("day_max_temp").text #Temperatura maxima y minima pronosticada
				mintemp = forecast.at("night_min_temp").text



#------------Comparo si la temperatura es mayor a 25 los proximos dias en Santiago de Chile----------------------


				
				if (mintemp.to_i > 25 && maxtemp.to_i >25)

					valor=true
					puts "Fue true"

				else

					valor=false
					puts "Fue false"
				end



				if !self.find_by(date: date)
					self.create({ date: date, text: text, rain: valor })
				end
			end
		end
	end




#Este metodo busca si los proximos dias la temperatura es mayor--------------------------
	def self.rain_comming? 
		self.request if self.count == 0
		self
			.where(:date => Date.today..(Date.today + 6.days))
			.pluck(:rain)
			.include?(true)
	end
end

#-------------------------------------------------------------------------------------------





#-----------------------------------------------------------------------------------------------------------


#maxtemp = forecast.at("day_max_temp").text #Aqui pongo la max temperatura del diamintemp = forecast.at("night_min_temp").text #Aqui pongo el minimo de la noche#text = "#{f_day}, #{f_night}"#puts "LA TEMPMAX y minimaaaaaaaaa ES #{text}"if !self.find_by(date: date)if(maxtemp>25)rain = trueelserain=falseendself.create({ date: date, text: text, rain: text.downcase.include?("rain") }) #Aqui debo cambiar a que sea mayor o menor que 25 gradosendendendendendend