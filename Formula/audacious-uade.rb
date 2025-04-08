class AudaciousUade < Formula
  desc "UADE plugin for Audacious and DeaDBeeF"
  homepage "https://github.com/mvtiaine/audacious-uade"
  url "https://github.com/mvtiaine/audacious-uade/releases/download/0.13.1/audacious-uade-0.13.1.tar.bz2"
  sha256 "8f308dc9e5bdcc8bb6cc49dee9ce4acf93d20c02026fff9043975be3937fd393"
  license "GPL-2.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "libopenmpt"
  depends_on "libxmp"
  depends_on "audacious"

  def install
    # TODO does not work since no permission to install deadbeef plugin to /Applications/DeaDBeeF.app/...
#    if OS.mac?
      # install cask deadbeef@nightly for DeaDBeeF support
#      ENV.append "CPPFLAGS", "-isystem/Applications/DeaDBeeF.app/Contents/Headers"
#      system "./configure", "--enable-players=all", "--enable-plugin-audacious=yes", "--with-static-stdlibs=no", "--with-audacious-plugindir=\"#{lib}/audacious\"", "--with-deadbeef-plugindir=/Applications/DeaDBeeF.app/Contents/PlugIns", *std_configure_args
#    else
      system "./configure", "--enable-players=all", "--enable-plugin-audacious=yes", "--with-static-stdlibs=no", "--with-audacious-plugindir=\"#{lib}/audacious\"", *std_configure_args  
#    end
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
