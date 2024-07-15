class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.12.1/audacious-uade-0.12.1.tar.bz2"
  sha256 "0292fba98ffad83edbb7d500d11615d924c42a94aaa220aad0f4f6b704369127"
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
