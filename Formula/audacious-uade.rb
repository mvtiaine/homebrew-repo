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

  def caveats
    <<~EOS
      IMPORTANT!
      In order for Homebrew Audacious to find the plugin, you must manually symlink it to the plugin dir:

      on macOS:
          ln -s "${HOMEBREW_PREFIX}/lib/audacious/Input/uade.dylib" "$(pkgconf --variable=plugin_dir audacious)/Input/uade.dylib"
      on Linux:
          ln -s "${HOMEBREW_PREFIX}/lib/audacious/Input/uade.so" "$(pkgconf --variable=plugin_dir audacious)/Input/uade.so"
    EOS
  end

  test do
    system "make", "check"
  end
end
