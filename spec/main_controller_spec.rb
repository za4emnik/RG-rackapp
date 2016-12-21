require 'spec_helper'

  RSpec.describe MainController do

  context '#initialize' do
    subject { MainController.new }

    before do
      $session = Hash.new
      $session['game'] = nil
    end

    it '@irb should be instance of RenderIRB class' do
      expect(subject.instance_variable_get(:@irb)).to be_kind_of(RenderIRB)
    end
  end

  context '#check' do
    subject { MainController.new }

    before do
      $post = Hash.new
    end

    it 'should return #you_won if codes coincide' do
      $session['game'].instance_variable_set(:@secret_code, '1111')
      $post['guess'] = '1111'
      allow(subject).to receive(:check).and_return true
      expect(subject.check).to be_truthy
    end

  end
end
