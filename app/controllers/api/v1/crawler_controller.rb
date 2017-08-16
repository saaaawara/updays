require 'net/https'
require 'uri'
require 'json'

module Api
    module V1
        class CrawlerController < ApplicationController

            # crawler
            def crawler
                uri = URI.parse("https://powerful-lake-26344.herokuapp.com/api")

                # miura local
                # uri = URI.parse('http://10.150.250.17:4000/api')

                http = Net::HTTP.new(uri.host, uri.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE

                req = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})

                req.body = {'categry'=>'hanabi', 'place'=>'愛知','symd'=>'2017/08/25','eymd'=>'2017/08/30'}.to_json

                # req = Net::HTTP.post_form(uri,{'category'=>'hanabi', 'place'=>'愛知','symd'=>'2017/08/25','eymd'=>'2017/08/30'})
                # req.set_form_data({'category'=>'hanabi', 'place'=>'愛知','symd'=>'2017/08/25','eymd'=>'2017/08/30'})
                p "request"
                p req
                # req = JSON.parse(req)
                puts req.body
                res = http.request(req)
                # res = JSON.parse(res)

                p "response"
                p res
                # p res.header
                p CGI.unescape(res.body)
                # p URI.decode(res.body)
                place = CGI.unescape(res.body)
                place = JSON.parse(place)
                tmp = place[0]
                p "nnnnnnnnnnnnnnnnnnnnnnnnn"
                p place
                p place.length
                p place[0].length
                p place[0]["place"]
                
                # p res.body
            end
        end
    end
end
