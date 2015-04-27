# encoding: utf-8

# require 'rest-client'
require "faraday"
require 'open-uri'

module Unionpay
  class Service
    class << self

      def auth_card auth_info

        user_id = auth_info.respond_to?(:user_id) ? auth_info.user_id : auth_info[:user_id]
        card = auth_info.respond_to?(:card) ? auth_info.card : auth_info[:card]
        name = auth_info.respond_to?(:name) ? auth_info.name : auth_info[:name]
        mobile = auth_info.respond_to?(:mobile) ? auth_info.mobile : auth_info[:mobile]

        params = {
          account: Unionpay.account,
          authType: 1,
          userId: user_id,
          card: card,
          name: name,
          mobile: mobile
        }
        sign = Unionpay.sign(params)
        params[:sign] = sign

        # server_url = "https://222.72.248.198"
        server_url = "https://data.unionpaysmart.com"

        connection = Faraday::Connection.new server_url,  { ssl: { verify: false } }
        response = connection.get '/auth/card', params
        puts response.body
      end

      def auth_status card
        params = {
          account: Unionpay.account,
          card: card,
        }
        sign = Unionpay.sign(params)
        params[:sign] = sign

        # server_url = "https://222.72.248.198"
        server_url = "https://data.unionpaysmart.com"
        connection = Faraday::Connection.new server_url,  { ssl: { verify: false } }
        response = connection.get 'auth/authStatus', params
        puts response.body
      end
    end
    
  end
end