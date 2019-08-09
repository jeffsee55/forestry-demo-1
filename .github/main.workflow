workflow "New workflow" {
  on = "push"
  resolves = ["@actions/jekyll"]
}

action "@actions/jekyll" {
  uses = "@actions/jekyll"
  env = {
    JEKYLL_ENV = "staging"
  }
}
