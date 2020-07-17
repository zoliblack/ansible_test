UID_MIN=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)
UID_MAX=$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)

USERS=$(awk -F: -v min=$UID_MIN -v max=$UID_MAX '{
  if ($3 >= min && $3 <= max) print $1
}' /etc/passwd)

now=$(date +%s)
#COUNTER=0
echo "---" >./guilty_users.yml
for user in $USERS; do
  #COUNTER=$((COUNTER+1))
  last_login=$(date -d "$(last -FRn 1 $user |
    egrep -v "wtmp begins|still logged in" |
    awk '{print $10 " " $11 " " $13 " " $12}')" +%s)
  [ $(( (now - last_login) / 86400 )) -le 90 ] && echo "$user:"  >>./guilty_users.yml
done
#echo "---" >./guilty_mails.yml
#for mail in $(cat /etc/passwd | awk -F ":" '{ print $1,": " $5 }'); do
#  echo "$mail" >>./guilty_mails.yml
#done