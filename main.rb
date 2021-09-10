# 勇者クラス
class Brave
  attr_accessor :name, :hp, :offense, :defense

  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    puts "#{monster.name}の残りのHPは#{monster.hp}だ"
  end

  private

    def decision_attack_type
      attack_num = rand(4)

      if attack_num == 0
        puts "必殺奥義"
        "special_attack"
      else
        puts "通常攻撃"
        "normal_attack"
      end
    end

    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
    end

    def cause_damage(**params)
      target = params[:target]
      damage = params[:damage]

      target.hp -= damage
      target.hp = 0 if target.hp < 0

      puts "#{target.name}は#{damage}のダメージを受けた"
    end

    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
    end
end

# モンスタークラス
class Monster
  attr_accessor :name, :hp, :offense, :defense

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    @transform_flag = false
    @trigger_of_transform = @hp * CALC_HALF_HP
  end

  def attack(brave)
    if @hp <= @trigger_of_transform && @transform_flag == false
      @transform_flag = true
      transform
    end
    puts "#{@name}の攻撃"

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}の残りのHPは#{brave.hp}だ"
  end

  private

    def calculate_damage(brave)
      @offense - brave.defense
    end

    def cause_damage(**params)
      target = params[:target]
      damage = params[:damage]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
      
      puts "#{target.name}は#{damage}のダメージを受けた"
    end

    def transform
      transform_name = "ドラゴン"

      puts "#{@name}は怒っている"
      puts "#{@name}は#{transform_name}に変身した"

      @offense *= POWER_UP_RATE
      @name = transform_name
    end
end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

loop do
  brave.attack(monster)
  if monster.hp <= 0
    exp = (monster.offense + monster.defense) * 2
    gold = (monster.offense + monster.defense) * 3
    puts "#{brave.name}は戦いに勝った"
    puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
    break
  end

  monster.attack(brave)
  if brave.hp <= 0
    puts "#{brave.name}は戦いに負けた"
    puts "目の前が真っ暗になった"
    break
  end
end