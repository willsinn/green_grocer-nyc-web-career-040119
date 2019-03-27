def consolidate_cart(cart)
  cart.each_object({}) |(key, h), result|
    if h.each ||
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
