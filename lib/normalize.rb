# Namespace and Wrapper that fetch JSON objects from Emergency Number API
# @since 0.1.0

module Normalize
  # Return values from hash object by looking up keys from {EmergencyNumber.get_country}.
  # Called when using dot notation on a hash object.
  #
  # @overload method_missing(sym, value)
  #   @param [Symbol] sym key in the hash object.
  #   @param [Object] * multiple number of args.
  # @return [Object] value the respective hash key points to.
  def method_missing(sym, *)
    r = fetch(sym) { fetch(sym.to_s) { super } }
    r.is_a?(Hash) ? r.extend(Normalize) : r
  end
end
