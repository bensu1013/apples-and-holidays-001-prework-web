require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each {|key, value|
    value.push(supply)
    }
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring].each {|key, value|
    value.push(supply)
    }
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  temphash = {holiday_name => supply_array}
  holiday_hash[season].merge!(temphash)
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  array = Array.new
  holiday_hash[:winter].each {|key, value|
    array.push(value)
    }
  array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  string = ""
  holiday_hash.each {|key, value|
    season = key.to_s
    string = string + "#{season.capitalize}:\n"
    value.each_pair {|k, v|
      day = k.to_s
      if day.include?('_')
        day = day.gsub '_', ' '
        string = string + "  " + day.split.map(&:capitalize).join(' ') + ": "
      else
        string = string + "  #{day.capitalize}: "
      end
      v.each.with_index {|x, i|
        tempstr = ""
        if x.include?(' ')
          tempstr = x.split.map(&:capitalize).join(' ')
        elsif x == x.upcase
          tempstr = x
        else
          tempstr = x.capitalize
        end
        if i == (v.length - 1)
          string = string + "#{tempstr}\n"
        else
          string = string + "#{tempstr}, "
        end
        }
      }
    }
  puts string
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = Array.new
  holiday_hash.each_pair {|key, value|
    value.each {|k, v|
      v.each {|x| x == "BBQ" ? array.push(k) : nil}
      }
    }
  array
end







