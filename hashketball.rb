require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def teams(team_name)
  case team_name
  when game_hash[:home][:team_name]
    game_hash[:home]
    when game_hash[:away][:team_name]
      game_hash[:away]
end
end

def num_points_scored(name) 
   game_points = nil
  game_hash.map do |location, team_stats|
   team_stats[:players].map do |index|
       if name == index[:player_name]
         game_points = index[:points]
     end
    end
  end
  game_points
end

def shoe_size(name) 
  size_answer = nil 
  game_hash.map do |location, team_stats|
   team_stats[:players].map do |index|
     index.map do |stat_name, value| 
       if name == index[:player_name]
         size_answer = index[:shoe]
       end
   end
 end 
 end 
 size_answer
end

def team_colors(team_name)
  teams(team_name)[:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(name)
  teams(name)[:players].map do |index|
    index[:number]
  end
end

def player_stats(name)
  name_stats = {}
  game_hash.map do |location, team_stats|
   team_stats[:players].map do |index|
     index.map do |stat_name, value|
       if name == index[:player_name]
         name_stats = index
       end 
     end 
   end 
 end
 name_stats
end

def big_shoe_rebounds
  shoe_check = 0 
  rebound_answer = nil
  game_hash.map do |location, team_stats|
    team_stats[:players].map do |index|
      if shoe_check <= index[:shoe]
        shoe_check = index[:shoe]
        rebound_answer = index[:rebounds]
  end
  end
  end
  rebound_answer
end

def most_points_scored
  highest_points = 0 
  game_hash.map do |location, team_stats|
    team_stats[:players].map do |index|
      if highest_points <= index[:points]
        highest_points = index[:points]
      end
    end 
  end
  highest_points
end

def home_sum 
  home_team = teams("Brooklyn Nets")
  home_team_points = []
  sum = 0
  home_team[:players].map do |index|
      home_team_points << index[:points]
    end
    home_team_points.map do |nums|
      sum += nums
    end
    sum
end

def away_sum 
  away_team = teams("Charlotte Hornets")
  away_team_points = []
  sum = 0
  away_team[:players].map do |index|
      away_team_points << index[:points]
    end
    away_team_points.map do |nums|
      sum += nums
    end
    sum
end

def winning_team
  if home_sum > away_sum
    return game_hash[:home][:team_name]
  elsif away_sum > home_sum
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  long_name = 0 
  long_name_winner = nil
  game_hash.map do |location, team_stats|
    team_stats[:players].map do |index|
      if long_name <= index[:player_name].length
        long_name = index[:player_name].length
        long_name_winner = index[:player_name]
  end
  end
  end
  long_name_winner
end

def most_steals
  highest_steals = 0 
  biggest_stealer = nil
  game_hash.map do |location, team_stats|
    team_stats[:players].map do |index|
      if highest_steals <= index[:steals]
        highest_steals = index[:steals]
        biggest_stealer = index[:player_name]
      end
    end 
  end
  biggest_stealer
end

def long_name_steals_a_ton?
  if player_with_longest_name = most_steals
    return true
  else 
    return false
  end
end