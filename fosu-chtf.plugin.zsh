# ~/.oh-my-zsh/custom/plugins/fosu-chtf/fosu-chtf.plugin.zsh

CHTF_PATH_PREFIX=/opt/homebrew

# Load chtf if it exists
if [[ -f "$CHTF_PATH_PREFIX/share/chtf/chtf.sh" ]]; then
  source "$CHTF_PATH_PREFIX/share/chtf/chtf.sh"
fi

# Function to check if chtf is installed
_check_chtf() {
  command -v chtf >/dev/null || return 1
}

# Function to load Terraform version from .chtfrc if it exists
_load_terraform_version_from_rc() {
  if [[ -f "$PWD/.chtfrc" ]]; then
    source "$PWD/.chtfrc"
  elif [[ -f "$HOME/.chtfrc" ]]; then
    source "$HOME/.chtfrc"
  fi
}

_terraform_not_found() {
  # Check again if terraform is now available
  unalias terraform
  if command -v terraform >/dev/null 2>&1; then
    # Run the command and don't re-alias terraform
    terraform "$@"
    return 0
  fi
  
  # Terraform still not found, keep the alias and prompt the user
  alias terraform=_terraform_not_found
  echo "Terraform version is not selected with chtf."
  echo "Please choose a version with 'chtf <version>' or set tf_version in .chtfrc."
  _check_chtf && {
    echo "Here are the currently installed versions:"
    chtf
  } 
}

# Function to check if Terraform is installed and set the version from .chtfrc or latest
_load_terraform() {
  if command -p terraform >/dev/null 2>&1; then
    return 0
  fi

  _check_chtf || return 1
  _load_terraform_version_from_rc

  if [[ -z "$tf_version" ]]; then
    alias terraform=_terraform_not_found
    return 0
  fi

  chtf "$tf_version" || return 1
}

_load_terraform

