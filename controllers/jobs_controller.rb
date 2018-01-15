class JobsController < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views, Proc.new { File.join(root, "views") }
	configure :development do
		register Sinatra::Reloader
	end

	get '/jobs' do
		@title = "Link-it"
		@jobs = Job.all
		erb :'jobs/index'
	end

	get '/jobs/new' do
		@job = Job.new
		erb :'jobs/new'
	end

	get '/jobs/:id' do
		id = params[:id].to_i
		@job = Job.find id
		erb :'jobs/show'
	end

	post '/jobs/' do
		job = Job.new
		job.title = params[:title]
		job.company = params[:company]
		job.sector = params[:sector]
		job.location = params[:location]
		job.salary = params[:salary]
		job.save
		redirect "/jobs"
	end

	delete '/jobs/:id' do
		id = params[:id].to_i
		Job.destroy id
		redirect "/jobs"
	end

	get '/jobs/:id/edit' do
		id = params[:id].to_i
		@job = Job.find id
		erb :'jobs/edit'
	end
end