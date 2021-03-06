class Secp256k1 < Formula
  homepage 'https://bitcoin.org/'
  url 'https://github.com/bitcoin-core/secp256k1.git'

  version "20160526"

  depends_on 'automake' => :build
  depends_on 'curl'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--enable-module-recovery",
                          "--disable-tests",
                          "--prefix=#{prefix}"
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
