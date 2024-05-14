# ZSH plugin for use with AI tools like:
# ShellGPT, oLLaMA, and others.

# Taken from:
# https://medium.com/@marc_fasel/smash-your-git-commit-messages-like-a-champ-using-chatgpt-0cbe8ea7b3df
function gitgpt {
  branchName="$(git branch --show-current)"
  _pt="Generate a concise git commit message that summarizes key changes."
  _pt="$_pt Stay high-level & combine smaller changes to overarching topics."
  _pt="$_pt Skip describing any reformatting changes."
  _pt="$_pt Remember title should be less than 50 characters."
  _pt="$_pt That includes the branch name, colon and space."
  _pt="$_pt Current branch format is ${branchName}: "
  _msg="$(git diff --staged | sgpt "$_pt")"
  _prefixedMsg="$branchName: $_msg"
  git commit -m "$_prefixedMsg"
  echo "Used git to commit below message:"
  echo
  echo "$_prefixedMsg"
  echo
  echo "To amend the commit message, run: git commit --amend"
  echo
  echo "Don't forget to push your changes!
}

