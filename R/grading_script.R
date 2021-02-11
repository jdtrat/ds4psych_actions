my_repo <- Sys.getenv("MY_GITHUB_REPO")

GITHUB_PAT <- Sys.getenv("GITHUB_PAT")

ds4psych_grading <- function(path) {

  # If Mason is not a collaborator, send her an invite and tag her in an issue
  if (!gh_collab_check(path, "smasongarrison", messages = FALSE)) {
    gh_collab_invite(path, "smasongarrison")
    gh_issue_new(path, title = "Please grade me!", body = "@smasongarrison, I've finished my lab. Please grade me!")
  } else {
    # if Mason is a collaborator, check to see whether there are any issues that mention her.
    # If so, assign her to all of them and remind her! If not, she must have closed them (:
    if (gh_issue_mention(path, collaborator = "smasongarrison")) {
      # Assign Mason to those -- nothing happens if we reassign
      which_issues <- as.numeric(gh_issue_list(path, mentioned = "smasongarrison")$number)
      lapply(which_issues, gh_issue_assign, path = path, assignees = "smasongarrison")
      # Add a comment pinging Mason to remind her!
      lapply(which_issues, gh_issue_comment, path = path,
             body = "@smasongarrison, this is a reminder to please grade me. I will reappear every 48 hours until you close this issue.")
    }
  }

}


ds4psych_grading(path = my_repo)
