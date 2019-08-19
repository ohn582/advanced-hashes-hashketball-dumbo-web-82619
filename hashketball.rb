require "pry"

def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors =>["Black","White"],
      :players => 
      {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
         "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
         "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
         "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
         "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise","Purple"],
      :players => 
      {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end



def num_points_scored(player_name)

  game_hash.each do |location, team|
    team[:players].each do |name,data|
        return data[:points] if player_name == name
    end
  end
end


def shoe_size(player_name)
  
  game_hash.each do |location, team|
    team[:players].each do |name,data|
        return data[:shoe] if player_name == name
    end
  end
end


def team_colors(name)
  
  game_hash.each do |location, team|
    return game_hash[location][:colors] if team[:team_name] == name
  end
end


def team_names
  
  game_hash.collect do |location, team|
    team[:team_name]
  end
end


def player_numbers(name)
  
  arr = []
  
  game_hash.each do |location, team|
    if team[:team_name] == name
      team[:players].each do |att, info|
        arr << info[:number]
      end
    end
  end
  return arr
end


def player_stats(name)
  game_hash.each do |location, team|
    team.each do |tel, int|
      if int.include?(name)
        return game_hash[location][tel][name]
      end
    end
  end
end



def big_shoe_rebounds
  
  player_name = 0
  shoe_size = 0
  
  game_hash.each do |location, team|
    team[:players].each do |tel, int|
      
      if int[:shoe] > shoe_size
        shoe_size = int[:shoe]
          player_name = int[:rebounds]
        end
      end
    end
    player_name
end


def most_points_scored
  
  score = 0
  max_player = nil

  game_hash.each do |location, team|
    team[:players].each do |name,data|
      
      if data[:points] > score
        score = data[:points]
        max_player = name
      end
    end
  end
  return max_player
end


def winning_team
  
  score = 0
  score2 = 0

  game_hash[:home][:players].each do |name,data|
    score += data[:points]
  end
  game_hash[:away][:players].each do |name,data|
    score2 += data[:points]
  end
    if score > score2
      game_hash[:home][:team_name]
    else score < score2
      game_hash[:away][:team_name]
    end
end


def player_with_longest_name

  person = nil

  game_hash.each do |location, data|
    data[:players].each do |name, value|
      if name.length > 12
        person = name
      end
    end
  end
  return person
end


def long_name_steals_a_ton?
  name_wit = nil
  steal_num = 10
  
  game_hash.each do |location, team|
    team[:players].each do |name,data|
      if data[:steals] > steal_num
        steal_num = data[:steals]
        name_wit = name
      end
    end
  end
  name_wit == player_with_longest_name
end



