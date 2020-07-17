Run healthcheck.yaml with -e to select a role:
	- sudoers: runs visudo -c on hosts
	- envfile: checks if the envfile set in /etc/sudoers, exists and has right ownership/ permission, if MODE is set to resolve, nstead 		   of printing out errors, its sets the file's ownership/permission to default (root:system, o-w)
	- sudo_permission: checks permission of files in /bin, /usr/bin, /usr/sbin recursivle (files need to have o-w)
	- logfile: check if logging is diasble in the files sudoers provide
	- logging: check if the logging file set in /etc/sudoers exists, and if logging is working(month and day comparsion)
	- all: runts all of the above

E.g.: ansible-playbook -i inventory -e 'role=envfile MODE=resolve' healthcheck.yaml

The inventory file needs to be configured(by default healthcheck runs on ALL of the hosts defined in this file):
- [group_name]: hosts grouped under one name (everyhost is part of 'all' by default)
- [group_name:vars]: the variables of a group
- ansible_host: ip of a host
- ansible_connection: the type of the connection
- ansible_user: user to connect to the hosts as
- ansible_password: users password
- ansible_become: decied wether to switch to another user or not
- ansbile_become_method: the way to switch users(e.g. su, sudo etc.)
- ansible_become_user: the user to switch to
- ansible_become_password: that users password
- ansible_python_interpreter: through which python should the script be run