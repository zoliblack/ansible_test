Idea: Based on old ITCS 104 health check template reconstruct ksh script in ansible
Now only few point implemented for testing purpose.
The ansible script checks: duplicated users, duplicated groups, log retention, and default maxage on AIX servers.

ansible.cfg
[defaults]
inventory   = ./inventory
remote_user = ansible
ask_pass    = false
log_path    = /home/h70177/.ansible/logs


[privilege_escalation]
become          = true
become_method   = sudo
become_user     = root
become_ask_pass = false


run: ansible-playbook OS_HC.yml
