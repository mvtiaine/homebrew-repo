class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.12.0/audacious-uade-0.12.0.tar.bz2"
  sha256 "e734fba0f8b4ed1204def5fdaf762423e376a8bd9b2cf70cca5b411a4334740c"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
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
