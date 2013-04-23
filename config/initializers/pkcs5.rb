=begin
require 'java'
 
module OpenSSL
  class PKCS5
    java_import org.bouncycastle.crypto.generators.PKCS5S2ParametersGenerator
    java_import org.bouncycastle.crypto.digests.SHA1Digest
 
    # it should probably support a non-bouncy-castle-digest as its 5th param, but nevermind
    def self.pbkdf2_hmac(pass, salt, iter, keylen, digest)
      generator = PKCS5S2ParametersGenerator.new
      generator.init(pass.to_java_bytes, salt.to_java_bytes, iter)
      parameters = generator.generateDerivedMacParameters(keylen*8)
      String.from_java_bytes(parameters.getKey())
    end
 
    def self.pbkdf2_hmac_sha1(pass, salt, iter, keylen)
      digest = SHA1Digest.new
      pbkdf2_hmac(pass, salt, iter, keylen, digest)
    end
  end
end
=end
