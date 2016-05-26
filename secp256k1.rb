require 'formula'

class Libbitcoin < Formula
  homepage 'https://libbitcoin.org/'
  url 'https://github.com/libbitcoin/secp256k1', :tag => 'master'

  depends_on 'automake' => :build
  depends_on 'curl'

  def patches
    # lboost_thread is named differently on osx
    DATA
  end

  def install
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
