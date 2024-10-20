class Inventory
    def initialize()
      @inventory = Hash.new
    end


    def valid_quantity(item,quantity)
        if @inventory[item][1]<quantity
            return false
        else
            return @inventory[item][1]-quantity
        end

    end


    def add_item(item,quantity,price)
        if @inventory[item]
            @inventory[item][1]+=quantity
            @inventory[item][0]+=quantity*price
        else
            @inventory[item]=[price,quantity]
        end
        return @inventory
    end

    def update_item(item,quantity,price)
        if !@inventory[item]
            return "Product not found in inventory !"
        else
            @inventory[item][1]=quantity
            @inventory[item][0]=quantity*price
        end

    end


    def remove_item(item,quantity)
        if @inventory[item]
            price=@inventory[item][0]
            valid_quantity=valid_quantity(item,quantity)
            if valid_quantity
                @inventory[item][1]=valid_quantity
                @inventory[item][0]=valid_quantity*price
                return @inventory
            else
                return "Not enough items to remove"
            end
        else
            return "Item does not exist !"
        end
    end

    def inventory_display
        puts '----------------------------------------------------------'
        puts 'Inventory Items     Quantity      Price       Total Price'
        puts '----------------------------------------------------------'

        @inventory.each do |key,value|
            total_price = value[0] * value[1]
            print "       #{key}             #{value[1]}          #{value[0]}              #{total_price} "
            print "\n"
        end
        puts "\n"
        puts '----------------------------------------------------------'
        puts "\n"

    end


end




I=Inventory.new
while true
    puts "1 -> Add item\n2 -> Remove item\n3 -> Update item\nq -> Quit"
    val = gets.chomp
  
    break if val == 'q'
  
    puts 'Enter name'
    item = gets.chomp
    puts 'Enter quantity'
    quantity = gets.chomp.to_i
  
    if val == '1'
      puts 'Enter price'
      price = gets.chomp.to_i
      I.add_item(item, quantity, price)
    elsif val == '2'
      I.remove_item(item, quantity)
    elsif val == '3'
      puts 'Enter price'
      price = gets.chomp.to_i
      I.update_item(item, quantity, price)
    else
      puts "Invalid option. Please select 1, 2, 3, or q."
      next
    end
  
    I.inventory_display
  end

     



