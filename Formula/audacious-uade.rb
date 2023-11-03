class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.9/audacious-uade-0.9.tar.bz2"
  sha256 "06ec2db917c3c6968fb540838b4c7ec61bb2fae41dd43f878511772dbfd5e6e9"
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
