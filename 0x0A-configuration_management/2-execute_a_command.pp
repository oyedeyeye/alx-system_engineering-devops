# Execute a command to Kill a process

exec { 'killmenow':
  command => 'pkill killmenow',
}
