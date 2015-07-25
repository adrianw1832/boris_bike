require 'bike'

describe Bike do
  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it 'should return false for working? after reported broken' do
    subject.report_broken
    expect(subject).to_not be_working
  end

  it "should not be working(retrun false) when it's broken" do
    subject.report_broken
    expect(subject.working?).to eq false
  end

  it "should not be broken(retrun false) when it's working" do
    expect(subject.broken?).to eq false
  end

  it 'should be working again after being fixed' do
    subject.report_broken
    subject.fix
    expect(subject.working?).to eq true
  end
end
