class Job
	attr_accessor :id, :title, :company, :sector, :location, :salary

	def save
		conn = Job.open_connection
		if (!self.id)
			sql = "INSERT INTO job (title, company, sector, location, salary) VALUES ('#{self.title}', '#{self.company}', '#{self.sector}', '#{self.location}','#{self.salary}')"
		else
			sql = "UPDATE job SET title='#{self.title}', company='#{self.company}', sector='#{self.sector}', location='#{self.location}', salary='#{self.salary}' WHERE id = #{self.id}"
		end
	conn.exec(sql)
	end

	def self.open_connection
		conn = PG.connect(dbname: "app")
	end

	def self.all
		conn = self.open_connection
		sql = "SELECT id,title,company,sector,location,salary FROM job ORDER BY id"
		results = conn.exec(sql)
		jobs = results.map do |tuple|
			self.hydrate tuple
		end
		jobs
	end

	def self.find id
		conn = self.open_connection
		sql = "SELECT * FROM job WHERE id = #{id} LIMIT 1"
		jobs = conn.exec(sql)
		job = self.hydrate jobs[0]
		job
	end

	def self.destroy id
		conn = self.open_connection
		sql = "DELETE FROM job WHERE id = #{id}"
		conn.exec(sql)
	end

	def self.hydrate post_data
		job = Job.new
		job.id = post_data['id']
		job.title = post_data['title']
		job.company = post_data['company']
		job.sector = post_data['sector']
		job.location = post_data['location']
		job.salary = post_data['salary']
		job
	end
end