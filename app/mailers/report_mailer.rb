class ReportMailer < ApplicationMailer
  default from: "mailgun@mailgun.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.looked_at_report.subject
  #
  def looked_at_report(to_address)
    @greeting = "Warning"

    attachments['filename.csv'] = File.read(Rails.root.join('public', 'csv.csv'))
    mail to: to_address, subject: "Someone is looking.", from: "mailgun@mailgun.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.report_data.subject
  #
  def report_data
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
