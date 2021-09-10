require './message_dialog'

# キャラクタークラス
class Character
  attr_accessor :name, :hp, :offense, :defense
  
  include MessageDialog

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end