include RSpec

require_relative 'node'

RSpec.describe Find, type: Class do
	let (:find) { Find.new }
	let (:kevin_bacon) { Node.new("Kevin Bacon") }
	let (:james_dean) { Node.new("James Dean") }
	let (:elizabeth_taylor) { Node.new("Elizabeth Taylor") }
	let (:chill_willis) { Node.new("Chill Willis") }
	let (:paul_fix) { Node.new("Paul Fix") }
	let (:natalie_wood) { Node.new("Natalie Wood") }
	let (:sal_mineo) { Node.new("Sal Mineo") }
	let (:ann_doran) { Node.new("Ann Doran") }
	let (:gregory_peck) { Node.new("Gregory Peck") }
	let (:john_megna) { Node.new("John Megna") }
	let (:robert_duvall) { Node.new("Robert Duvall") }
	let (:larry_semon) { Node.new("Larry Semon") }
	let (:kate_price) { Node.new("Kate Price") }
	let (:dorothy_dwan) { Node.new("Dorothy Dwan") }
	let (:john_pickard) { Node.new("John Pickard") }
	let (:carlos_rivas) { Node.new("Carlos Rivas") }
	let (:john_fielder) { Node.new("John Fielder") }
	let (:john_hurt) { Node.new("John Hurt") }
	let (:robert_patrick) { Node.new("Robert Patrick") }
	let (:fourth_layer) { Node.new("Fourth Layer") }
	let (:fifth_layer) { Node.new("Fifth Layer") }
	let (:sixth_layer) { Node.new("Sixth Layer") }
	let (:seventh_layer) { Node.new("Seventh Layer") }

	describe "film_actor_hash" do 
		it "properly finds a person any number of degrees away with proper error handling" do 
			##1
			james_dean.film_actor_hash['Giant'] = [elizabeth_taylor, chill_willis, paul_fix]
			james_dean.film_actor_hash['Rebel Without a Cause'] = [natalie_wood, sal_mineo, ann_doran]
			paul_fix.film_actor_hash['To Kill a Mockingbird'] = [gregory_peck, john_megna, robert_duvall]
			paul_fix.film_actor_hash['The Perfect Clown'] = [larry_semon, kate_price, dorothy_dwan]
			robert_duvall.film_actor_hash['True Grit'] = [john_pickard, carlos_rivas, john_fielder]
			robert_duvall.film_actor_hash['Jayne Mansfield\'s Car'] = [john_hurt, robert_patrick, kevin_bacon]
			robert_patrick.film_actor_hash['Fourth from James Dean'] = [fourth_layer]
			fourth_layer.film_actor_hash['Fifth from James Dean'] = [fifth_layer]
			fifth_layer.film_actor_hash['Sixth from James Dean'] = [sixth_layer]
			sixth_layer.film_actor_hash['Seventh from James Dean'] = [seventh_layer]
			find.find_kevin_bacon(james_dean)
		end
	end
end

##james dean