require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  let(:bike1) { double :bike, broken?: false }
  let(:bike2) { double :bike, broken?: true }

  it 'should accept a bike, broken or not' do
    expect((subject.dock bike1).pop).to eq bike1
    expect((subject.dock bike2).pop).to eq bike2
  end

  describe '#dock' do
    it 'should raise an error when something other than a bike is docked' do
      expect { subject.dock double :not_bike }.to raise_error 'Not a bike'
    end
  end

  describe '#release_bike' do
    it 'should raise an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      subject.dock bike2
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

    it 'should release a working bike when there is a mix of working and broken bikes' do
      subject.dock bike1
      subject.dock bike2
      expect(subject.release_bike).to eq bike1
    end
  end

  describe '#release_broken_bike' do
    it 'should raise an error when there are no bikes available' do
      expect { subject.release_broken_bike }.to raise_error 'No bikes available'
    end

    it 'does not release working bikes' do
      subject.dock bike1
      expect { subject.release_broken_bike }.to raise_error 'No broken bikes available'
    end

    it 'only release broken bikes for repair' do
      subject.dock bike2
      subject.dock bike1
      expect(subject.release_broken_bike).to be bike2
    end
  end

  describe '#release_specific_bike' do
    let(:bike3) { double :bike, broken?: false }
    before(:each) { subject.dock bike1; subject.dock bike2 }

    it 'should release the specificed bike' do
      expect(subject.release_specific_bike(0)).to be bike1
    end

    it 'should not contain the bike after being released' do
      subject.release_specific_bike(0)
      expect(subject.bikes).not_to include(bike1)
    end
  end

  it_behaves_like BikeContainer
end
