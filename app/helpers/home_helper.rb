# frozen_string_literal: true

module HomeHelper
  def bot_request?
    uAgent = request.env["HTTP_USER_AGENT"]
    if uAgent.nil?
      false
    else
      BotDetection.bot?(uAgent)
    end
  end
end
