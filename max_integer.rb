class Integer
  N_BYTES = [42].pack('i').size
  p N_BYTES
  N_BITS = N_BYTES * 16
  p N_BITS
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

p Integer::MAX              #=> 4611686018427387903
#p Integer::MAX.class        #=> Fixnum
#p (Integer::MAX + 1).class  #=> Bignum
