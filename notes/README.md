# salt
Salt command
salt 'minion01' state.sls webserver
# to call a state -> top.sls file
base:
    '*':
        - docker.remove

Comment: Configured package repo 'deb https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ bionic main'

equivalent to -> deb https://packages.gitlab.com/runner/gitlab-runner/{{ grains['os']|lower }}/ {{ grains['oscodename'] }} main
