class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.9.2/audacious-uade-0.9.2.tar.bz2"
  sha256 "7af3982ad0b1b7164fb41dfd00c6fe17ec1f3b9dc43c625ee887ba498f2588f6"
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
    system bin/"audacious", "--help"
  end
end
