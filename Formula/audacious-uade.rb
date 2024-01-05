class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.11.2/audacious-uade-0.11.2.tar.bz2"
  sha256 "d72dea78026b42f3981ec1c5ea4739eb2cf9bab8fbe660288244ee09b800e8e1 "
  license "GPL-2.0-or-later"

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
    system "make", "check"
  end
end
