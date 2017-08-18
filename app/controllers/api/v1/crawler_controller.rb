require 'net/https'
require 'uri'
require 'json'
# require 'timers'

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
                symd = Date.today
                eymd = Date.today + 150
                place = User.find_by(id: user_id).prefecture
                categry = Event.where(user_id: user_id).order("RANDOM()").first.jenre
                # categry = "海水浴場"
                categry = "花火"
                symd = symd.to_s.gsub('-', '/')
                eymd = eymd.to_s.gsub('-', '/')
                
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
                # p res
                p CGI.unescape(res.body)
                tmp = CGI.unescape(res.body)
                @events = JSON.parse(tmp)

                p @events
                @schedules = Schedule.where(user_id: user_id)
                @goEvent = []
                @events.each { |event|
                    p event["symd"]
                    p event["eymd"]
                    if event["symd"] == event["eymd"]
                        p "同じ"
                        if @schedules.find_by(date: event["symd"])
                            p "NG"
                            event["name"] = ""
                        else
                            p "OK"
                            @goEvent.push(event)
                        end
                    else
                        p "違う"
                    end
                }
                # @goEvent = @events.where(name: "")
                p @goEvent
                @result = @goEvent.shuffle.first
                @image = Image.where(jenre: categry).shuffle.first
                # p @image
                # @result.push()
                p "result"
                p @result

                render 'api/v1/crawler/event_ai', formats: 'json', handlers: 'jbuilder'
            end

            def timer
                # timers = Timers::Group.new
                # timer = timers.every(5) { puts "every"}

                # loop do
                #     interval = timers.wait_interval
                #     inputs = gets.chomp
                #     if inputs.empty?
                #         timers.fire
                #     else
                #         puts inputs
                #     end
                # end
            end

        end
    end
end
