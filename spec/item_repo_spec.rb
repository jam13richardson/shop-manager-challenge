require 'item'
require 'item_repository'

RSpec.describe ItemRepository do

    def reset_shop_tables
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'shop-manager-test' })
      connection.exec(seed_sql)
    end
  
    before(:each) do 
      reset_shop_tables
    end
  
    it 'gets all items' do
      repo = ItemRepository.new
      current_items = repo.all
      expect(current_items.length).to eq 2
      expect(current_items[0].item_name).to eq 'Chutney'
      expect(current_items[0].unit_price).to eq 3
      expect(current_items[0].quantity).to eq  200
      expect(current_items[1].item_name).to eq 'Ben & Jerrys'
      expect(current_items[1].unit_price).to eq  5
      expect(current_items[1].quantity).to eq 500
    end
  
    it 'add single item' do
      repo = ItemRepository.new
      crisps = Item.new
      crisps.item_name = 'Crisps'
      crisps.unit_price = 2
      crisps.quantity = 500
      repo.create(crisps)
      added_item = repo.find(3)
      expect(added_item[0].item_name).to eq 'Crisps'
      expect(added_item[0].unit_price).to eq 2
      expect(added_item[0].quantity).to eq 500
    end
  
  
  
  
  end
  
  
  