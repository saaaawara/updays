require 'test_helper'

class NoticificationMailerTest < ActionMailer::TestCase

  test "invite" do
    # メールを送信後キューに追加されるかどうかをテスト
    email = NoticificationMailer.create_invite('me@example.com',
                                     'friend@example.com', Time.now).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
 
    # 送信されたメールの本文が期待どおりの内容であるかどうかをテスト
    assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You have been invited by me@example.com', email.subject
    assert_equal read_fixture('invite').join, email.body.to_s
  end

end
