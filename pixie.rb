class Pixie < Formula
  desc "A small, fast, native lisp with 'magical' powers"
  homepage "https://pixie-lang.org"
  head "https://github.com/pixie-lang/pixie.git"

  depends_on "libffi"
  depends_on "libedit"
  depends_on "libuv"
  depends_on "boost"

  def install
    system "make build_with_jit"
    bin.install "pixie-vm"
  end

  test do
    system "pixie \"(println (str 'Pixie's here!')))\""
  end
end
