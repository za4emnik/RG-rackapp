require 'spec_helper'

RSpec.describe Controller do

  context '#initialize' do
    subject { Controller.new }
    attr_accessors = %w(status header body env)

    attr_accessors.each do |attr|
      it "calss should have :#{attr} attr_accessor" do
        should have_attr_accessor(:"#{attr}")
      end
    end
  end

  context '#not_found' do
    subject { Controller.new.not_found }

    it 'status should be equal \'404\'' do
      expect(subject.status).to eq(404)
    end

    it 'body should be equal \'Not found\'' do
      expect(subject.body).to eq('Not found!')
    end

    it 'should return self' do
      expect(subject).to be_kind_of(Controller)
    end

  end
end
