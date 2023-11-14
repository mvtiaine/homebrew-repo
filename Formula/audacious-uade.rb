class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.10.1/audacious-uade-0.10.1.tar.bz2"
  sha256 "bb29f899070ba7988bc113b49197f59ba5ec8bbb334d8bd1ebf27a7302d35aae"
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
