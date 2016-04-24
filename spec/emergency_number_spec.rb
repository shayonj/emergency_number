require 'spec_helper'

describe EmergencyNumber do
  it 'has a version number' do
    expect(EmergencyNumber::VERSION).not_to be nil
  end

  it 'returns valid json set for valid ISO3361-1_alpha-2 or ISO3361-1_numeric code' do
    expect(EmergencyNumber).to respond_to :get_country
    us = EmergencyNumber.get_country(:us)
    expect(us).not_to be_empty
  end

  it 'returns valid json set for country AQ.' do
    expect(EmergencyNumber).to respond_to :get_country
    aq = EmergencyNumber.get_country(:aq)
    expect(aq).not_to be_empty
  end

  it 'must raise method missing if attribute is not present' do
    expect { EmergencyNumber.foo_attribute }.to raise_error NoMethodError
  end
end
