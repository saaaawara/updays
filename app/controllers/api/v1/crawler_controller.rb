require 'net/https'
require 'uri'
require 'json'

module Api
    module V1
        class CrawlerController < ApplicationController

            # crawler
            def crawler

                # heroku
                uri = URI.parse("https://powerful-lake-26344.herokuapp.com/api")

                # miura local
                # uri = URI.parse('http://10.150.250.17:4000/api')

                http = Net::HTTP.new(uri.host, uri.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE

                req = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})

                # req.body = {'categry'=>'hanabi', 'place'=>'愛知',
                #         'symd'=>'2017/08/25',
                #         'eymd'=>'2017/08/30'}.to_json

                req.body = {'categry' => params[:categry],
                            'place' => params[:place],
                            'symd' => params[:symd],
                            'eymd' => params[:eymd]}.to_json

                p "request"
                p req
                puts req.body
                res = http.request(req)

                p "response"
                # show response header
                p res
                p CGI.unescape(res.body)
                tmp = CGI.unescape(res.body)
                @events = JSON.parse(tmp)
                # tmp = place[0]
                p @events
                # p place
                # p place.length
                # p place[0].length
                p @events[0]["place"]
                
                # p res.body
                render 'api/v1/crawler/crawler', formats: 'json', handlers: 'jbuilder'
            end

            # search ivent
            def search
                user_id = params[:user_id]
                symd = params[:symd]
                eymd = params[:eymd]
                categry = params[:jenre]
                @user = User.find_by(id: user_id)
                if @user
                    place = @user[:prefecture]
                end

                # local
                # uri = URI.parse('localhost:3000/api/v1/crawler')
                # heroku
                uri = URI.parse("https://powerful-lake-26344.herokuapp.com/api")

                # http = Net::HTTP.new(uri.host, uri.port)
                # req = Net::HTTP::Post.new(uri.request_uri, 
                #     initheader = {'Content-Type' =>'application/json'})
                # req.body = {'categry' => categry,
                #             'place' => place,
                #             'symd' => symd,
                #             'eymd' => eymd}.to_json
                # res = http.request(req)

                # p res

                http = Net::HTTP.new(uri.host, uri.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE
                req = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
                req.body = {'categry' => categry,
                            'place' => place,
                            'symd' => symd,
                            'eymd' => eymd}.to_json

                p "request"
                p req
                puts req.body
                res = http.request(req)
                p "response"
                p res
                p CGI.unescape(res.body)
                tmp = CGI.unescape(res.body)
                @events = JSON.parse(tmp)

                render 'api/v1/crawler/crawler', formats: 'json', handlers: 'jbuilder'
            end

            # event_ai
            def event_ai
                user_id = params[:user_id]
                symd = DateTime.now
                eymd = symd.since(10.days)
                place = User.find_by(id: user_id).prefecture
                # categry = Event.where(user_id: user_id,
                #     rand(Event.first.id..Event.last.id)).first
                categry = "花火"
                
                # local
                # uri = URI.parse('localhost:3000/api/v1/crawler')
                # heroku
                uri = URI.parse("https://powerful-lake-26344.herokuapp.com/api")

                http = Net::HTTP.new(uri.host, uri.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE
                req = Net::HTTP::Post.new(uri.request_uri, 
                    initheader = {'Content-Type' =>'application/json'})
                req.body = {'categry' => categry,
                            'place' => place,
                            'symd' => symd,
                            'eymd' => eymd}.to_json

                p "request"
                p req
                puts req.body
                res = http.request(req)
                p "response"
                p res
                p CGI.unescape(res.body)
                tmp = CGI.unescape(res.body)
                @events = JSON.parse(tmp)

                render 'api/v1/crawler/crawler', formats: 'json', handlers: 'jbuilder'
            end

        end
    end
end
