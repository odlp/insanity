require 'rspec'

describe 'Flaky spec' do
  it 'passes, sometimes' do
    expect([1, 1, 2].sample).to eq 1
  end
end
