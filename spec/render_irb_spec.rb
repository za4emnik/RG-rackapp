require 'spec_helper'

RSpec.describe Router do

  context '#initialize' do
    subject { RenderIRB.new('context') }

    it '@context shoul be equal context' do
      expect(subject.instance_variable_get(:@context)).to eq('context')
    end
  end
end
