binary = File.read!("./examples/files/in.au")
port = Port.open({:spawn, "pacat"}, [])
send(port, {self, {:command, binary}})
send(port, {self, {:command, binary}})
