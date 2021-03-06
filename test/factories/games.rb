FactoryGirl.define do
  factory :game do
    notes "Game Notes"
    played_on Time.now
    version 1
    
    location { association(:location) }
    players { 4.times.collect { association(:player) } }
    winner { players.first }
  end
end