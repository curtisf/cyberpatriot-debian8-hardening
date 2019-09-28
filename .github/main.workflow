workflow "New workflow" {
  on = "push"
  resolves = ["transfer files"]
}

action "Auth GCloud" {
  uses = "actions/gcloud/cli@6a43f01e0e930f639b90eec0670e88ba3ec4aba3"
  secrets = ["GCLOUD_AUTH"]
}

action "transfer files" {
  uses = "actions/gcloud/cli@6a43f01e0e930f639b90eec0670e88ba3ec4aba3"
  needs = ["Auth GCloud"]
  runs = "gcloud compute scp --recurse .  realestategame:/ramhacks2019"
  secrets = ["GCLOUD_AUTH"]
}
