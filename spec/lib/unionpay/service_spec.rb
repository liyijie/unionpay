# encoding: utf-8
require 'spec_helper'

describe "Unionpay::Service" do
  before do
    # Unionpay.account = "T100068"
    # Unionpay.private_key = "T100068"
    Unionpay.account = "100068"
    Unionpay.private_key = "629520f88aa44dee8291f9162ae70842"
  end

  it "should auth card correct on test enviroment" do
    auth_info = {
      user_id: "test3",
      card: "6222520358610008",
      name: "章羽",
      mobile: "15353990026"
    }
    Unionpay::Service.auth_card auth_info
  end

  it "should auth card correct on production enviroment" do
    auth_info = {
      user_id: "test3",
      card: "6222520358610008",
      name: "章羽",
      mobile: "15353990026"
    }
    Unionpay::Service.auth_card auth_info
  end

  it "should query auth status success" do
    card = "6222520358610008"
    Unionpay::Service.auth_status card
  end
end