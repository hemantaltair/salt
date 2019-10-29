gitlab:
  runner:
    downloadpath: "https://packages.gitlab.com/runner/gitlab-runner/packages/linuxmint/sonya/gitlab-runner_10.4.0_{{ grains['osarch'] }}.deb/download"
    username: "gitlab-runner"
    url: "http://gitlab.pclm.altair.com/" # MANDATORY
    token: "Nxdq9LJFMWMt_48izSgF" # MANDATORY
    home: /home/gitlab-runner
    executor: shell
