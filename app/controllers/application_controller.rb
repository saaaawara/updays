class ApplicationController < ActionController::API
    # デフォルトでは無効になっていたcookieを有効に
    include ActionController::Cookies
    # sessionを全コントローラーで使用するため
    include SessionsHelper

    # cookieの試しとして作成した
    def root
        # p "test"
        # p request.url
        # p request.method
        # p request.remote_ip
        # # これで値を取得している
        # param = params[:count].to_i
        # param += 1
        # p param
        # cookies['count'] = param
        # str = "string"
        # render json: param

        p "test"
        hanabi = Hanabi.all
        p hanabi
        
    end
end
