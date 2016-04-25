require 'spec_helper'

describe EmergencyNumber do
  before :each do
    @us = EmergencyNumber.get_country(:us)
    @aq = EmergencyNumber.get_country(:aq)
    @invalid = EmergencyNumber.get_country(:foobar)
  end
  it 'takes nil just fine' do
    expect { EmergencyNumber.get_country }.to_not raise_error
  end

  context 'tests for valid country codes' do
    it 'has a version number' do
      expect(EmergencyNumber::VERSION).not_to be nil
    end

    it 'returns valid json set for valid ISO3361-1_alpha-2 or ISO3361-1_numeric code' do
      expect(EmergencyNumber).to respond_to :get_country
      expect(@us).not_to be_empty
      expect(@us.data).not_to be_empty
    end

    it 'returns valid json data set for US code' do
      expect(@us.data.country.name).to eq('United States of America')
      expect(@us.error).to eq('')
      expect(@us.data.dispatch.all).to eq(['911'])
      expect(@us.data.dispatch.gsm).to eq(nil)
      expect(@us.data.dispatch.fixed).to eq(nil)
      expect(@us.data.nodata).to eq(false)
    end

    it 'returns non-empty and valid json set for country case like AQ.' do
      expect(EmergencyNumber).to respond_to :get_country
      expect(@aq).not_to be_empty
    end

    it 'returns valid json data set with valid values for AQ code' do
      expect(@aq.data.country.name).to eq('Antarctica')
      expect(@aq.error).to eq('No Data for this Territory')
      expect(@aq.data.dispatch.all).to eq([''])
      expect(@aq.data.dispatch.gsm).to eq(nil)
      expect(@aq.data.dispatch.fixed).to eq(nil)
      expect(@aq.data.nodata).to eq(true)
    end
  end

  context 'tests for invalid country code' do
    it 'returns valid json set' do
      expect(EmergencyNumber).to respond_to :get_country
      expect(@invalid).not_to be_empty
      expect(@invalid.error).to eq('No Country Found')
      expect(@invalid.data).to be_nil
    end
  end
end
