# 勇者クラス
class Brave
  attr_accessor :name, :hp, :offense, :defense

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# モンスタークラス
class Monster
  attr_accessor :name, :hp, :offense, :defense

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
brave2 = Brave.new(name: "セフィロス", hp: 1000, offense: 200, defense: 200)
brave3 = Brave.new(name: "マリオ", hp: 700, offense: 50, defense: 100)

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)


puts "NAME: #{brave.name}"
puts "HP: #{brave.hp}"
puts "OFFENSE: #{brave.offense}"
puts "DEFENSE: #{brave.defense}"

brave.hp -= 30

puts "#{brave.name}はダメージを受けた！残りのHPは#{brave.hp}だ"

puts <<~TEXT
  NAME: #{brave2.name}
  HP: #{brave2.hp}
  OFFENSE: #{brave2.offense}
  DEFENSE: #{brave3.defense}
TEXT

puts <<~TEXT
  NAME: #{brave3.name}
  HP: #{brave3.hp}
  OFFENSE: #{brave3.offense}
  DEFENSE: #{brave3.defense}
TEXT