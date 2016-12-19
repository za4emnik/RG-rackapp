class MainController < Controller

  def initialize
    if !$session['game']
      $session['game'] = Game.new
      $session['game'].generate_code
    end
  end

  def index
    self.body = render
    self
  end

  def hint
    $session['game'].get_hint
    self.body = render
    self
  end

  def check
    return you_won if $session['game'].secret_code == $post['guess']
    $session['game'].guess = $post['guess']
    $session['game'].check
    self.body = render
    self
  end

  def you_won
    $session['game'] = nil
    self.body = ERB.new(File.read('./app/views/congrats.html.erb')).result(binding)
    self
  end

  def save
    scores = $session['game'].get_scores
    scores[:user_name] = $post['name']
    $session['game'].save_achievement(scores)
  end

  def achievements
    @achievements = Game.new.read_achievements
    self.body = ERB.new(File.read('./app/views/achievements.html.erb')).result(binding)
    self
  end

  def render
    ERB.new(File.read('./app/views/index.html.erb')).result(binding)
  end
end
