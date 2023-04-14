require 'order'
require 'order_repository'

describe OrderRepository do

    def reset_shop_tables
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'shop-manager-test' })
      connection.exec(seed_sql)
    end
    
      before(:each) do 
        reset_shop_tables
      end
    
      it 'all orders' do
        repo = OrderRepository.new
        orders = repo.all
        expect(orders.length).to eq 2
        expect(orders[0].id).to eq 1
        expect(orders[0].customer_name).to eq 'Jamie'
        expect(orders[0].item_name).to eq 'Chutney'
        expect(orders[0].order_date).to eq '2023-01-04'
        expect(orders[1].id).to eq 2
        expect(orders[1].customer_name).to eq 'Ian'
        expect(orders[1].item_name).to eq 'Coke'
        expect(orders[1].order_date).to eq '2023-03-12'
      end
    
      it 'gets a single orders' do
        repo = OrderRepository.new
        single_order = repo.find(1)
        expect(single_order[0].id).to eq 1
        expect(single_order[0].customer_name).to eq 'Jamie'
        expect(single_order[0].item_name).to eq 'Chutney'
        expect(single_order[0].order_date).to eq '2023-01-04'
      end
    
      it 'creates a new order' do
        repo = OrderRepository.new
        new_order = Order.new
        new_order.customer_name = 'Annie'
        new_order.item_name = 'Daffodils'
        new_order.order_date = '02-10-2023'
        repo.create(new_order)
        find_new_order = repo.find(3)
        expect(find_new_order[0].customer_name).to eq 'Annie'
        expect(find_new_order[0].item_name).to eq 'Daffodils'
        expect(find_new_order[0].order_date).to eq '02-10-2023'
      end
    
    end