require 'mysql2'
require 'json'


file = File.open('data/products.json')
content = file.readlines
content = JSON.parse content[0]

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "mywy")

content.each do |c|
	unless client.query('select * from products where id = "' + c["id"].to_s + '"').count > 0
		client.query('INSERT INTO products (id, name, price, inprice, inventory, sales, barcode, node_id) 
		VALUES ("' + c["id"].to_s + '", "' + c["name"].to_s + '", "' + c["price"].to_s + '", "' + c["inprice"].to_s + '", "' + c["inventory"].to_s + '", "' + c["sales"].to_s + '", "' + c["barcode"].to_s + '", "' + c["node_id"].to_s + '")');
		puts c["id"]
	end
end

#file = File.open('data/pictures.json')
#content = file.readlines
#content = JSON.parse content[0]

#client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "mywy")

#content.each do |c|
#	unless client.query('select * from pictures where id = "' + c["id"].to_s + '"').count > 0
#		length = c["image"]["image"]["url"].length
#		url = c["image"]["image"]["url"][48...length]
#		client.query('INSERT INTO pictures (id, image, product_id) 
#			VALUES ("' + c["id"].to_s + '", "' + url.to_s + '", "' + c["imageable_id"].to_s + '")')
#	end
#end