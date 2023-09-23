class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.8.2/audacious-uade-0.8.2.tar.bz2"
  sha256 "914e77ac4eebc4bbd35074a97e40831a20927ec9f714eee3ad204437d39a6daf"
  license "GPL-2.0-or-later"

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "audacious"

  on_linux do
    depends_on "libbsd"
  end

  def install
    system "./configure", "--with-audacious-plugindir=\"#{lib}/audacious\"", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system bin/"audacious", "--help"
  end
end
