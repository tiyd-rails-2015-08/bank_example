require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  test "looked_at_report" do
    mail = ReportMailer.looked_at_report
    assert_equal "Looked at report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "report_data" do
    mail = ReportMailer.report_data
    assert_equal "Report data", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
