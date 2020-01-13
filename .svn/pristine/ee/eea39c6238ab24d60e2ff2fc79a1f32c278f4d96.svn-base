module CustomersHelper
  def invitation_accepted(email)
    logger.debug"\nemail is #{email}\n"
    _user = User.where('email = ?', email).first
    if !_user.nil?
      logger.debug"\nif !_user.nil?\n"
      if !_user.invitation_accepted_at.nil?
        logger.debug"\nif !_user.invitation_accepted_at.nil?\n"
        return true
      end
    else
      return false
    end
  end
end
