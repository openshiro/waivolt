class BusinessMailer < ApplicationMailer
  default from: Rails.configuration.emails.updates_mailbox!
  delegate :pluralize, to: "ActionController::Base.helpers"

  def welcome
    @business = params[:business]

    mail(
      to: @business.user.email,
      from: Rails.configuration.emails.support_mailbox!,
      subject: t(".subject")
    )
  end

  def subscribed
    @business = params[:business]
    @developer_count = SignificantFigure.new(Developer.visible.count).rounded

    mail(
      to: @business.user.email,
      from: Rails.configuration.emails.support_mailbox!,
      subject: t(".subject")
    )
  end

  def cancel_subscription
    @business = params[:business]

    mail(
      to: @business.user.email,
      from: Rails.configuration.emails.support_mailbox!,
      subject: t(".subject")
    )
  end

  def developer_profiles
    @business = params[:business]
    @developers = params[:developers]
    subject = "#{pluralize(@developers.count, "new professional profile")} added to Waivolt"

    mail(to: @business.user.email, subject:)
  end

  def new_terms
    @business = params[:business]
    from = Rails.configuration.emails.support_mailbox!
    subject = "Updated Waivolt terms of use and hiring agreement"

    mail(to: @business.user.email, from:, subject:)
  end

  def survey
    @business = params[:business]
    from = Rails.configuration.emails.support_mailbox!
    subject = "Why do you use Waivolt to hire? 1 question survey"

    mail(to: @business.user.email, subject:, from:, message_stream: :broadcast)
  end
end
