binary = File.read!("./examples/files/in.au")
pacat = :os.find_executable('pacat')
port = Port.open({:spawn_executable, pacat}, [])
send(port, {self, {:command, binary}})
send(port, {self, {:command, binary}})
