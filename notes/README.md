# salt
Salt command
salt 'minion01' state.sls webserver
# to call a state -> top.sls file
base:
    '*':
        - docker.remove
