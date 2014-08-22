class Mailer
  extend Mote::Helpers

  def self.render(template, params = {})
    return mote("./mails/#{ template }.mote", params)
  end
end
