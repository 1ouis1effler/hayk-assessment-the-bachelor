require 'pry'

def get_first_name(name)
  name.split(' ')[0]
end 

  def get_first_name_of_season_winner(data, season)
  season_data = data[ season ]
  contestant = season_data.find do |contestant|
    contestant["status"] == "Winner"
  end 
  
  get_first_name(contestant["name"])
  #binding.pry
end

def all_contestants(data)
  data.values.flatten
end

def get_contestant_name(data, occupation)
    all_contestants(data).find do |contestant|
      occupation == contestant["occupation"]
    end [ "name" ]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).count do |contestant|
    hometown == contestant["hometown"]
  end 
end

def get_occupation(data, hometown)
  contestant_from_hometown = all_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end 
  contestant_from_hometown["occupation"]
end

def get_average_age_for_season(data, season)
   contestant_age = data[season].map do |season|
    season["age"].to_i
   end
   (contestant_age.sum / contestant_age.count.to_f).round
end 