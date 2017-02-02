module Exceptions
  class BaseException < RuntimeError
    attr_reader :status, :message
  end
  class AccessDenied < BaseException
    def initialize
      @status = 401
      @message = "Access Denied"
    end
  end
end
