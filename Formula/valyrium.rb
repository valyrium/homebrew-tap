# typed: false
# frozen_string_literal: true

class Valyrium < Formula
  desc "OpenAI-compatible HTTP gateway that routes Chat Completions requests to Claude models via the Claude Code CLI, with MCP-relay tool calling"
  homepage "https://github.com/valyrium/valyrium"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/valyrium/valyrium/releases/download/v1.0.0/valyrium_1.0.0_darwin_amd64.tar.gz"
      sha256 "cdcfa3a306985e54c696cbc46274fdbecf85f50a95b86993e705e051165b9658"

      def install
        bin.install "valyrium"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/valyrium/valyrium/releases/download/v1.0.0/valyrium_1.0.0_darwin_arm64.tar.gz"
      sha256 "415f3d6542dbd36d9907169c5133bba524d3f0779eab0ccc1bd6528983469f0b"

      def install
        bin.install "valyrium"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/valyrium/valyrium/releases/download/v1.0.0/valyrium_1.0.0_linux_amd64.tar.gz"
      sha256 "4a4d147f4a2377db7d18133c3360fa13fceba35c314848b60341389e935bec43"
      def install
        bin.install "valyrium"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/valyrium/valyrium/releases/download/v1.0.0/valyrium_1.0.0_linux_arm64.tar.gz"
      sha256 "2a49c643ff1705fb06cb3e7195bc07a227d6ade23f2d87504951e9677752f9e8"
      def install
        bin.install "valyrium"
      end
    end
  end

  test do
    system "#{bin}/valyrium", "--version"
  end
end
