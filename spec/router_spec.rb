require 'spec_helper'

RSpec.describe Router do

  context '#initialize' do
    subject { Router.new(env) }
    let(:env) { 'env' }

    it '@routes should be instance of hash' do
      expect(subject.instance_variable_get(:@routes)).to be_kind_of(Hash)
    end

    it '@env should be equal env' do
      expect(subject.instance_variable_get(:@env)).to eq(env)
    end
  end

end
