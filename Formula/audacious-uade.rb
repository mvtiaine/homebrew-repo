class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.12.3/audacious-uade-0.12.3.tar.bz2"
  sha256 "9d49a041551696511b61db0b1c31e0fc379633be5696de26b63876d94e31a932"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "audacious"

  def install
    system "./configure", "--with-audacious-plugindir=\"#{lib}/audacious\"", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
