module Normalize
  def method_missing(sym, *)
    r = fetch(sym) { fetch(sym.to_s) { super } }
    Hash === r ? r.extend(Normalize) : r
  end
end
