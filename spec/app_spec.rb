require_relative "../app.rb"

RSpec.describe Application do

    def reset_shop_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'shop-manager-test' })
        connection.exec(seed_sql)
      end
      
      before(:each) do 
    reset_shop_tables
  end

context 'user interface' do
    it 'lists all the items in the shop' do 
        io = double :io
        app = Application.new("shop-manager-test",  io, OrderRepository.new, ItemRepository.new)
        expect(io).to receive(:puts).with "Welcome to the shop management program!"
        expect(io).to receive(:puts).with "\nWhat do you want to do?"
        expect(io).to receive(:puts).with "1 = list all shop items\n2 = create a new item"
        expect(io).to receive(:puts).with "3 = list all orders\n4 = create a new order"
        expect(io).to receive(:puts).with "Enter your choice:"
        expect(io).to receive(:gets).and_return "1"
        expect(io).to receive(:puts).with "Here is the list of items:"
        expect(io).to receive(:puts).with "* 1 - Chutney - Unit price: 3 - Quantity: 200" 
        expect(io).to receive(:puts).with "* 2 - Ben & Jerrys - Unit price: 5 - Quantity: 500"
        app.interface 
      end


    it 'creates a new item' do
        io = double :io
        app = Application.new("shop-manager-test", io, OrderRepository.new, ItemRepository.new)
        expect(io).to receive(:puts).with "Welcome to the shop management program!"
        expect(io).to receive(:puts).with "\nWhat do you want to do?"
        expect(io).to receive(:puts).with "1 = list all shop items\n2 = create a new item"
        expect(io).to receive(:puts).with "3 = list all orders\n4 = create a new order"
        expect(io).to receive(:puts).with "Enter your choice:"
        expect(io).to receive(:gets).and_return "2"
        expect(io).to receive(:puts).with "Enter new item name:"
        expect(io).to receive(:gets).and_return "Water"
        expect(io).to receive(:puts).with "Enter new item unit price:"
        expect(io).to receive(:gets).and_return "1"
        expect(io).to receive(:puts).with "Enter new item quantity:"
        expect(io).to receive(:gets).and_return "200"      
        app.interface 
      end

      it 'lists all shop orders' do
        io = double :io
        app = Application.new("shop-manager-test", io, OrderRepository.new, ItemRepository.new)
        expect(io).to receive(:puts).with "Welcome to the shop management program!"
        expect(io).to receive(:puts).with "\nWhat do you want to do?"
        expect(io).to receive(:puts).with "1 = list all shop items\n2 = create a new item"
        expect(io).to receive(:puts).with "3 = list all orders\n4 = create a new order"
        expect(io).to receive(:puts).with "Enter your choice:"
        expect(io).to receive(:gets).and_return "3"
        expect(io).to receive(:puts).with "Here is the list of orders:"
        expect(io).to receive(:puts).with "* 1 - Jamie - Chutney - Order date: 2023-01-04"
        expect(io).to receive(:puts).with "* 2 - Ian - Coke - Order date: 2023-03-12"
        app.interface 
      end

      it 'creates a new order' do
        io = double :io
        app = Application.new("shop-manager-test", io, OrderRepository.new, ItemRepository.new)
        expect(io).to receive(:puts).with "Welcome to the shop management program!"
        expect(io).to receive(:puts).with "\nWhat do you want to do?"
        expect(io).to receive(:puts).with "1 = list all shop items\n2 = create a new item"
        expect(io).to receive(:puts).with "3 = list all orders\n4 = create a new order"
        expect(io).to receive(:puts).with "Enter your choice:"
        expect(io).to receive(:gets).and_return "4"
        expect(io).to receive(:puts).with "Enter new customer name:"
        expect(io).to receive(:gets).and_return "Trixie"
        expect(io).to receive(:puts).with "Enter new item name:"
        expect(io).to receive(:gets).and_return "Beer"
        expect(io).to receive(:puts).with "Enter new order date (YYYY-MM--DD):"
        expect(io).to receive(:gets).and_return "2023-04-14"      
        app.interface 
      end
    end
end