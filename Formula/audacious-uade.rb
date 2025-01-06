class AudaciousUade < Formula
  desc "UADE plugin for Audacious media player"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.12.4/audacious-uade-0.12.4.tar.bz2"
  sha256 "3d1b5f5dc42e04f9cc8c355b4783644507dcc36e13ac7e2662cad3b84432ff91"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "audacious"

  def install
    system "./configure", "--enable-plugin-audacious=yes", "--with-static-stdlibs=no", "--with-audacious-plugindir=\"#{lib}/audacious\"", *std_configure_args
    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOS
      IMPORTANT!
      In order for Homebrew Audacious to find the plugin, you must manually symlink it to the plugin dir:

      macOS:
          ln -s "${HOMEBREW_PREFIX}/lib/audacious/Input/uade.dylib" "$(pkgconf --variable=plugin_dir audacious)/Input/uade.dylib"
      Linux:
          ln -s "${HOMEBREW_PREFIX}/lib/audacious/Input/uade.so" "$(pkgconf --variable=plugin_dir audacious)/Input/uade.so"
    EOS
  end

  test do
    system "make", "check"
  end
end
