class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.12.1/audacious-uade-0.12.2.tar.bz2"
  sha256 "3f1e15adbc574307d6d706a27a39d19037d7720a2d632ac1f8c5159f40787da5"
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
