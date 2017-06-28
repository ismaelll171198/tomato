class NewMovieMailer < ActiveJob::Base

require File.expand_path('../config/application',__FILE__)

Rails.application.load_tasks

task default: :test #run the test suite by default

RAKE_TASK_ARG_FIELD_SEP =";".freeze

#Output SQL to STDOUT by setting the SQL env var to true, e.g.
#SQL=true rake serpbook:fetch_keyword_rankings
ActiveRecord::Base.logger = Logger.new[STDOUT] if ENV["SQL"] == "true"

namescape :nombre1  do 
	desc "Aqui ponemos un poco lo que hace este trabajo"
	task el_nombre_que_yo_quiera: :environment do
		NombreJob.perform_later
	end	
end

namescape :el_nombre_que_yo_quiera  do 
	desc "Aqui ponemos un poco lo que hace este trabajo"
		if Time.now.wday.between?(1,5)
		task el_nombre_que_yo_quiera: :environment do
			CarpetaMarketing::NombreJob.perform_later
		end	
	end	
end

namescape :el_nombre_que_yo_quiera  do
	desc "Aqui ponemos un poco lo que hace este trabajo"
	task el_nombre_que_yo_quiera: :environment do
		if Time.now.day.between?(1,7)
			if Time.now.monday?
				NombreJob.perform_later
			end	
		end
	end
end



end
