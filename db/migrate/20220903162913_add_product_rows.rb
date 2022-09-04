class AddProductRows < ActiveRecord::Migration[7.0]
  def change
    sql_query = "insert into products(name, image_path, size, room, color, price, material, construction, style, created_at, updated_at) 
                 values('Mornadi Velvet Bed', 'https://dummyjson.com/image/i/products/31/1.jpg', '4x6', 'bedroom', 'purple', 120, 'cotton', 'machinemade', 'traditional', '#{Time.now}', '#{Time.now}'),
                 ('Sofa for Coffe Cafe', 'https://dummyjson.com/image/i/products/32/1.jpg', '3x5', 'outdoor', 'gray', 80, 'blends', 'handwoven', 'modern', '#{Time.now}', '#{Time.now}'),
                 ('3 Tier Corner Shelves', 'https://dummyjson.com/image/i/products/33/1.jpg', '10x14', 'kids', 'white', 700, 'wool', 'shag', 'shag', '#{Time.now}', '#{Time.now}'),
                 ('Plastic Table', 'https://dummyjson.com/image/i/products/34/1.jpg', '8x10', 'diningroom', 'multicolor', 90, 'jute-natural fibers', 'dhurrie', 'casual', '#{Time.now}', '#{Time.now}'),
                 ('3 DOOR PORTABLE', 'https://dummyjson.com/image/i/products/35/1.jpg', '9x12', 'livingroom', 'black', 310, 'synthetics', 'handknotted', 'vintage', '#{Time.now}', '#{Time.now}'),
                 ('2 Tier Corner Shelves', 'https://dummyjson.com/image/i/products/33/1.jpg', '9x12', 'kids', 'white', 500, 'wool', 'shag', 'shag', '#{Time.now}', '#{Time.now}'),
                 ('Plastic Table1', 'https://dummyjson.com/image/i/products/34/1.jpg', '6x9', 'diningroom', 'multicolor', 75, 'jute-natural fibers', 'dhurrie', 'casual', '#{Time.now}', '#{Time.now}'),
                 ('2 DOOR PORTABLE', 'https://dummyjson.com/image/i/products/35/1.jpg', '8x10', 'livingroom', 'black', 250, 'synthetics', 'handknotted', 'vintage', '#{Time.now}', '#{Time.now}')
                 "
    ActiveRecord::Base.connection.execute(sql_query)
  end
end
