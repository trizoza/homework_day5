def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  return pet_shop[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pets_shop, sold_pets_amount)
  return pets_shop[:admin][:pets_sold] += sold_pets_amount
end

def stock_count(pets_shop)
  return pets_shop[:pets].length()
end

def pets_by_breed(pets_shop, breed)
  asked_breed = []
  for i in pets_shop[:pets]
    asked_breed.push(i[:breed]) if i[:breed] == breed
  end
  return asked_breed
end

def find_pet_by_name(pets_shop, pet_name)
  for i in pets_shop[:pets]
    return i if i[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(pets_shop, pet_name)
  for i in pets_shop[:pets]
    pets_shop[:pets].delete(i) if i[:name] == pet_name
  end
end

def add_pet_to_stock(pets_shop, new_pet)
  pets_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pets_shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet)
      customer[:cash] -= pet[:price]
      add_or_remove_cash(pets_shop, pet[:price])
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pets_shop, 1)
    else
      puts "Sorry, we cannot sell you the animal, you have insufficient funds."
    end
  else
    puts "Sorry, no pet like that in our stock"
  end
end