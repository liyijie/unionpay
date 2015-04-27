require 'spec_helper'

describe Unionpay do
  it 'has a version number' do
    expect(Unionpay::VERSION).not_to be nil
  end

  it 'sign correct' do
    Unionpay.private_key = "00000000"
    params = {
      account: "12345678",
      card: "62000000000000000",
      timestamp: "2011-01-01 00:00:00"
    }
    expect(Unionpay.sign(params)).to eq("F3F62E20ECBE6E51C42C273269EDB0C8")
  end
end
