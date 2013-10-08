module Mercury
  module Authentication

    def can_edit?
      current_user && current_user.facilitator # check here to see if the user is logged in/has access
    end

  end
end
