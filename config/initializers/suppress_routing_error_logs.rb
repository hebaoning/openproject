module NoRoutingErrorLogging
  def log_error(env, wrapper)
    super unless wrapper.exception.is_a? ActionController::RoutingError
  end
end

ActionDispatch::DebugExceptions.prepend NoRoutingErrorLogging if Rails.env.production?
