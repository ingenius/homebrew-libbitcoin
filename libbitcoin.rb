require 'formula'

class Libbitcoin < Formula
  homepage 'https://libbitcoin.org/'
  url 'https://github.com/libbitcoin/libbitcoin.git', :tag => 'master'
  version "20160526"

  depends_on 'automake' => :build
  depends_on 'curl'

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
