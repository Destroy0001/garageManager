# fileName : Helpers.rb
# fileDescription : Contains common helper functions.

#checks if a slot is valid or not, a slot has to be a non-zero integer
def is_valid_slot(str)
   return /\A\d+\z/.match(str) && str.to_i > 0
end
