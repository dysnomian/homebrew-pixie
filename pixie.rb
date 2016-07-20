# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Pixie < Formula
  desc "A small, fast, native lisp with ;magical' powers"
  homepage "https://github.com/pixie-lang/pixie"
  url "pixie"
  head "https://github.com/pixie-lang/pixie.git", :using => :git

  depends_on "cmake" => :build
  depends_on "libffi-dev"
  depends_on "libedit-dev"
  depends_on "libuv-dev"
  depends_on "libboost-all-dev"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "make build_with_jit"
    system "ln -s /usr/local/bin/pixie ./pixie-vm"
  end

  test do
    system "pixie \"(println (str 'Pixie's here!')))\""
  end
end
