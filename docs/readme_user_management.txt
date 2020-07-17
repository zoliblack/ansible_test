Starting usermanagement_test.yml right now reaches out to all configured hosts, 
and check the users with files/usercheck.sh bash script, if they were logged in in the last 90  days.
The script uses the "last" command, and several "shell" and "awk" options to create a list of these users,
and ansible pulls that list back from server.

Things under development:
- mail the users, who are not logged in 90 or more days. Mail can be sent already, just needs to be the actual user's mail address.
- after specified time, suspend/delete inactive users.
- implement the same functions to AIX with "ksh"
- Later will implement some options to add users to the systems

Version 0.1.2
