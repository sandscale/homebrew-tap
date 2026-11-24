# Copyright (c) 2026 Neural Inverse. All rights reserved.
# SPDX-License-Identifier: BUSL-1.1. See LICENSE in the project root for license information.
#
# Homebrew formula of the Sandscale CLI for the tap (github.com/sandscale/homebrew-tap: brew install sandscale/tap/sandscale).
# A template: scripts/release-sandscale.mjs replaces every placeholder (a name between at signs) from the release's SHA256SUMS and
# refuses to write the formula while one is left. Edit the template, never a rendered formula.
class Sandscale < Formula
  desc "Sandscale cloud workspaces, sandboxes, build hosts and vault from the terminal"
  homepage "https://sandscale.dev"
  version "1.1.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.1.2/sandscale-darwin-arm64"
      sha256 "07aa331b32f8e7eb5a81810c1046414f0f7ee603872478893f640fa8380f908f"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.1.2/sandscale-darwin-x64"
      sha256 "67e6c0f61d2ac40e7cd33c63d3ddd22a2acd2ee2b16a16996a89bdd846f6de60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.1.2/sandscale-linux-arm64"
      sha256 "e2fed07d92a7c3e2c785922ac5f3a1b8573e121ff04ce82d2c6035037cec153e"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.1.2/sandscale-linux-x64"
      sha256 "796ad67c3b005e28bbf264ad53624193a335cd26f67291e44223cc84aa71efb1"
    end
  end

  def install
    # The download is the executable itself, named after its asset.
    bin.install Dir["sandscale-*"].first => "sandscale"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sandscale --version").strip
    assert_match "sandscale <command>", shell_output("#{bin}/sandscale help")
  end
end
