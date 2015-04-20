import pexpect

device_ip = "10.16.134.7"
username = "sltnetadmin"

child = pexpect.spawn('ssh %s@%s' % (username, device_ip))
child.expect('password:')
child.sendline('11lmh1lm')
child.expect('>')
child.sendline('enable')
child.expect('#')
child.sendline('upgrade sftp://motoupgrade:11lmh1lm!@10.8.5.21/ADSP/AP6532-5.5.5.0-018R.img')
i = child.expect(['(yes/no)?'])
if i==0:
	child.sendline('yes')
	print('Key accepted, upgrade in progress...')
	child.expect('#', timeout=300)
else:
	print('Upgrade in progress...')
	child.expect('#', timeout=300)
child.sendline('reload')
child.expect('(y/n):')
child.send('y')
