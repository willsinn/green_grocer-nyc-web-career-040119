def consolidate_cart(cart)
  cart.each_with_object({}) do |item, result|
    item.each do |type, attributes|
      if result[type]
        attributes[:count]+=1
      else
        attributes[:count]=1
        result[type]=attributes
     end
   end
  end
end

def apply_coupons(cart: [], coupons: [])
  couponed_items= {}
  coupons.each do |coupon_hash|
    cart.each do |name, item_hash|
      if name == coupon_hash[:item] && item_hash[:count] >= coupon_hash[:num]
        item_hash[:count] = item_hash[:count] - coupon_hash[:num]
        new_name = coupon_hash[:item] + " w/coupon"
        couponed_items[new_name] = { :price => coupon_hash[:cost], 
                                     :count => 1, 
                                     :clearance => item_hash[:clearance] }
      end 
    end
  end
  cart.merge(couponed_items)
end

def apply_clearance(cart)
  cart.each do |name, properties|
    if properties[:clearance]
      updated_price = properties[:price] * 0.80
      properties[:price] = updated_price.round(2)
    end
  end
  cart
end


def checkout(cart, coupons)
  # code here
end
