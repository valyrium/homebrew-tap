# typed: false
# frozen_string_literal: true

class Valyrium < Formula
  desc "OpenAI-compatible HTTP gateway that routes Chat Completions requests to Claude models via the Claude Code CLI, with MCP-relay tool calling"
  homepage "https://github.com/valyrium/valyrium"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/valyrium/valyrium/releases/download/v1.1.0/valyrium_1.1.0_darwin_amd64.tar.gz"
      sha256 "cefeb8c08872a2b44d74d59af9c3ef246cce18eddd1b368594849b14f27c51e4"

      def install
        bin.install "valyrium"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/valyrium/valyrium/releases/download/v1.1.0/valyrium_1.1.0_darwin_arm64.tar.gz"
      sha256 "04e16ebe9997777b69cbfcd623e7eb76d1d6ab3c4d209e456597ca98331d37eb"

      def install
        bin.install "valyrium"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/valyrium/valyrium/releases/download/v1.1.0/valyrium_1.1.0_linux_amd64.tar.gz"
      sha256 "cce6762c796164dbc963818e828811adbd037caa9c43d09310be712a16e328a6"
      def install
        bin.install "valyrium"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/valyrium/valyrium/releases/download/v1.1.0/valyrium_1.1.0_linux_arm64.tar.gz"
      sha256 "40d6d00e49248aa1cf827fbe780aa3a849e54ed132b0e25c10ef02a91cb10bb9"
      def install
        bin.install "valyrium"
      end
    end
  end

  service do
    run [opt_bin/"valyrium"]
    run_type :immediate
    keep_alive true
    working_dir var
    log_path var/"log/valyrium.log"
    error_log_path var/"log/valyrium.log"
    environment_variables PATH: "#{Dir.home}/.local/bin:#{std_service_path_env}"
  end

  test do
    system "#{bin}/valyrium", "--version"
  end
end
