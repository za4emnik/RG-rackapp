class MainController < Controller

  def initialize
    @irb = RenderIRB.new(self)
    if !$session['game']
      $session['game'] = CodebreakerGem::Game.new
      $session['game'].generate_code
    end
  end

  def index
    @irb.render 'wellcome', 'guest'
  end

  def run
    $session['player'] = $post['player_name'] if $post['player_name']
    @irb.render 'index'
  end

  def hint
    $session['game'].get_hint
    @irb.render 'index'
  end

  def check
    return you_won if $session['game'].secret_code == $post['guess']
    $session['game'].guess = $post['guess']
    $session['game'].check
    @irb.render 'index'
  end

  def you_won
    $session['game'] = nil
    @irb.render 'congrats'
  end

  def save
    scores = $session['game'].get_scores
    scores[:user_name] = $post['name']
    $session['game'].save_achievement(scores)
  end

  def achievements
    @achievements = CodebreakerGem::Game.new.read_achievements
    @irb.render 'achievements'
  end

  def render
    @irb.render 'index'
  end
end
