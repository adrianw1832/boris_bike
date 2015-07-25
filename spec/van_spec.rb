require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do
  it 'should respond to load' do
    expect(subject).to respond_to(:load).with(1).argument
  end

  it 'should respond to unload' do
    expect(subject).to respond_to(:unload)
  end

  it_behaves_like BikeContainer
end
