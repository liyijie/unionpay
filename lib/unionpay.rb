require_relative "unionpay/version"
require_relative "unionpay/conf"
require 'digest'
require 'eventmachine'
require "websocket"
require "websocket-native"
require "websocket-eventmachine-base"
require "websocket-eventmachine-client"

module Unionpay

  class << self
    attr_accessor :account, :private_key

    def sign(params)
      sign_str = params.sort.map do |k,v|
        "#{k}#{v}" unless Unionpay::SignIgnoreParams.include? k
      end.join
      Digest::MD5.hexdigest("#{sign_str}#{private_key}").upcase
    end
  end
end

# Unionpay.account = "T100068"
# Unionpay.private_key = "T100068"

# Unionpay.account = "100068"
# Unionpay.private_key = "629520f88aa44dee8291f9162ae70842"

# EM.run do

#   puts "before connect"
#   # url = "ws://222.72.248.198:8080/push/#{Unionpay.account}/#{Unionpay.private_key}"
#   url = "wss://push.unionpaysmart.com/push/#{Unionpay.account}/#{Unionpay.private_key}"
#   puts "url is: #{url}"
#   ws = WebSocket::EventMachine::Client.connect(uri: url)
#   puts "to be connect"

#   ws.onopen do
#     puts "Connected"
#   end

#   ws.onmessage do |msg, type|
#     puts "Received message: #{msg}"
#   end

#   ws.onclose do |code, reason|
#     puts "Disconnected with status code: #{code}"
#   end

#   EventMachine.next_tick do
#     puts "in next_tick"
#     # ws.send "Hello Server!"
#   end

# end
