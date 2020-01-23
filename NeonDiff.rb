class NeonDiff < Formula
  desc "Application to colorize unified diffs"
  homepage "https://github.com/maxrd2/neon-diff"
  url "https://github.com/maxrd2/neon-diff/archive/master.zip"
  version "1.0"
  sha256 "51864f53d9cba0dca916aca9f743e4df7aefe454b2cd57f6862ac94029228c10"
  head "https://github.com/maxrd2/neon-diff.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "icu4c"

  def install
    args = std_cmake_args
    args << "-DCMAKE_CXX_FLAGS=-I#{HOMEBREW_PREFIX}/opt/icu4c/include/unicode -I#{HOMEBREW_PREFIX}/opt/icu4c/include"
    args << "-DCMAKE_C_FLAGS=-I#{HOMEBREW_PREFIX}/opt/icu4c/include/unicode -I#{HOMEBREW_PREFIX}/opt/icu4c/include"
    args << "-DCMAKE_LD_FLAGS=-L#{HOMEBREW_PREFIX}/opt/icu4c/lib"
    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
