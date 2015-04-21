expect
set timeout 210
spawn ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no sltnetadmin@10.16.134.8
expect "password:"
send "11lmh1lm\r"
expect ">"
send "enable\r"
expect "#"
send "upgrade sftp://motoupgrade:11lmh1lm!@10.8.5.21/ADSP/AP6532-5.7.0.0-057R.img\r"
expect {
	(yes/no)?	{send "yes\r"}
	-timeout 5	exp_continue	
}
expect timeout
expect "#"
send "reload\r"
expect "(y/n):"
sleep 3
send "y"
sleep 3
exit -onexit puts "BYE!"
