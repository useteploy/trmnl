class Trmnl < Formula
  desc "Terminal IDE — preconfigured terminal development environment"
  homepage "https://github.com/yourusername/homebrew-trmnl"
  head "https://github.com/yourusername/homebrew-trmnl.git", branch: "main"
  version "1.0.0"

  depends_on "neovim"
  depends_on "yazi"
  depends_on "lazygit"
  depends_on "fzf"
  depends_on "zoxide"
  depends_on "ripgrep"
  depends_on "fd"
  depends_on "bat"
  depends_on "eza"
  depends_on "git-delta"
  depends_on "starship"
  depends_on "btop"
  depends_on "tldr"
  depends_on "gh"
  depends_on "jq"

  def install
    bin.install "bin/trmnl"

    # Install all config files to share/trmnl/
    (share/"trmnl").install "config/nvim"
    (share/"trmnl").install "config/zellij"
    (share/"trmnl").install "config/yazi"
    (share/"trmnl").install "config/starship.toml"
    (share/"trmnl").install "config/gitconfig"
    (share/"trmnl").install "config/zshrc-block"
  end

  def post_install
    # Check for multiplexer
    zellij_installed = system("command -v zellij > /dev/null 2>&1")
    tmux_installed = system("command -v tmux > /dev/null 2>&1")

    unless zellij_installed || tmux_installed
      opoo "No multiplexer found! Installing Zellij..."
      system("brew install zellij")
      unless system("command -v zellij > /dev/null 2>&1")
        puts "\n⚠️  Zellij installation failed. Would you like to use Tmux instead? (y/n)"
        if $stdin.gets.chomp.downcase == 'y'
          system("brew install tmux")
          puts "Tmux installed. Run 'trmnl setup' to configure."
        else
          puts "Please install Zellij manually: brew install zellij"
        end
      end
    end

    ohai "trmnl installed! Run 'trmnl setup' to configure everything."
    ohai "Run 'trmnl keys' for a keybind cheat sheet."
  end

  def caveats
    <<~EOS
      To complete setup, run:
        trmnl setup

      Then restart your terminal or run:
        source ~/.zshrc

      For a Nerd Font (needed for icons), install:
        brew install --cask font-jetbrains-mono-nerd-font

      Useful commands:
        trmnl keys      — keybind cheat sheet
        trmnl doctor    — check installation
        trmnl uninstall — remove configs
    EOS
  end
end
  # ── CRITICAL ADDITIONS FROM RESEARCH ────────────────────────────
  depends_on "git-credential-manager"  # Secure git authentication
  # Note: cargo-flamegraph installed via: cargo install flamegraph
  # Note: Better documentation tools available as Neovim plugins
