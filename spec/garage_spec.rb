require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer

  it 'fixes broken bikes' do
    bike = double :bike
    subject.add_bike bike
    expect(bike).to receive :fix
    subject.fix_bikes
  end
end
