use IO::Socket::INET;
 
# auto-flush on socket
$| = 1;
 
# creating a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '127.0.0.1',
    LocalPort => '9999',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);

die "cannot create socket $!\n" unless $socket;
print "server waiting for client connection on port 9999\n";
 
while(1)
{
    # waiting for a new client connection
    my $client_socket = $socket->accept();
 
    # get information about a newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();
    print "connection from $client_address:$client_port\n";
 
    # read up to 1024 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1024);
    print "received data: $data\n";

    # create visualization of battle field
    
 
    # write response data to the connected client
    $data = "Throwing dice....";
    $client_socket->send($data);
    
    sleep(3);
    
    my $randNum = int(rand(6));
    
    $client_socket->send($randNum);
   
   
   
   
    }
    
   

    shutdown($client_socket, 1);
    # notify client that response has been sent
    

 
$socket->close();

