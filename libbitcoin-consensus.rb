require 'formula'

class LibbitcoinConsensus < Formula
  homepage 'https://libbitcoin.org/'
  url 'https://github.com/libbitcoin/libbitcoin-consensus.git'
  version "20160526"

  depends_on 'automake' => :build
  depends_on 'secp256k1'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libbitcoin`.
    system "false"
  end
end
