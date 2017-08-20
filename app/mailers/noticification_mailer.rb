require 'rubygems'
require 'bundler/setup'
require 'action_mailer'

class NoticificationMailer < ApplicationMailer

    # send mail
    def send_confirm_to_user(user,result)
    # def send_confirm_to_user
        @user = user
        @result = result
        mail(
          subject: "UPちゃんからのお知らせ", #メールのタイトル
          to: @user.email #宛先
        #   to: "ogasawara.kyoji.17@shizuoka.ac.jp"
          # to: "ryo.kt.in@gmail.com"
        ) do |format|
          format.html
          p "send mail"
        end

    end
end
