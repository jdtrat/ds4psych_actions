my_repo <- Sys.getenv("MY_GITHUB_REPO")

simplegit::gh_issue_new(path = my_repo,
                        title = "Hello? Does this work?",
                        body = "I hope so! @smasongarrison ! I'm close thanks to Tan.",
                        .token = Sys.getenv("GITHUB_PAT"))

# ds4psych_grading <- function(path) {
#
#   # If Mason is not a collaborator, send her an invite and tag her in an issue
#   if (!simplegit::gh_collab_check(path, "smasongarrison", messages = FALSE)) {
#     simplegit::gh_collab_invite(path, "smasongarrison")
#     simplegit::gh_issue_new(path, title = "Please grade me!", body = "@smasongarrison, I've finished my lab. Please grade me!")
#   } else {
#     # if Mason is a collaborator, check to see whether there are any issues that mention her.
#     # If so, assign her to all of them and remind her! If not, she must have closed them (:
#     if (simplegit::gh_issue_mention(path, collaborator = "smasongarrison")) {
#       # Assign Mason to those -- nothing happens if we reassign
#       which_issues <- as.numeric(simplegit::gh_issue_list(path, mentioned = "smasongarrison")$number)
#       lapply(which_issues, simplegit::gh_issue_assign, path = path, assignees = "smasongarrison")
#       # Add a comment pinging Mason to remind her!
#       lapply(which_issues, simplegit::gh_issue_comment, path = path,
#              body = "@smasongarrison, this is a reminder to please grade me. I will reappear every 48 hours until you close this issue.")
#     }
#   }
#
# }
#
#
# ds4psych_grading(path = my_repo)
#
#
