class Node
	attr_accessor :name
	attr_accessor :film_actor_hash

	def initialize(name)
		@name = name
		@film_actor_hash = {}
		@queue = []
	end

	def []=(key, val)
		@film_actor_hash[key] = val
	end

	def [](key)
		@film_actor_hash[key]
	end


end

class Find
	def initialize
		@queue = []
	end

	def find_kevin_bacon(person, link = [])
		if @queue != [] ##THE FIRST OBJECT IN THE QUEUE IS DELETED, AS IT'S BEING WORKED ON RIGHT NOW
			@queue.shift
		end
		person.film_actor_hash.each do |movie, stars|
			stars.each do |star|
				link_duplicate = link.dup
				new_link = return_new_link(link_duplicate, movie, person.name)
				@queue << [star, new_link] unless new_link.length > 5
				if star.name === "Sixth Layer"
					return found(new_link)
				end
				if @queue == [] 
					p "Either the name is more than 6 degrees away, or not in the database."
					return
				end
			end
		end	
		find_kevin_bacon(@queue[0][0], @queue[0][1]) if @queue
	end

	def found(link)
		full_statement = ""
		link.each do |role|
			person = role.keys[0].to_s
			movie = role.values[0]
			statement = "#{person}, who was in '#{movie}' with "
			full_statement.concat(statement)
		end
		full_statement = full_statement.concat("Kevin Bacon with a total bacon number of #{link.length}.")
		p full_statement
	end

	def return_new_link(old_link, movie_name, person_name)
		new_link = old_link << {"#{person_name}": "#{movie_name}"}
		return new_link
	end
end