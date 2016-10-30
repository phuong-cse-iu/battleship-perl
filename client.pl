use IO::Socket::INET;
use strict; 
    # auto-flush on socket
    $| = 1;
     
    # create a connecting socket
    my $socket = new IO::Socket::INET (
        PeerHost => '127.0.0.1',
        PeerPort => '9999',
        Proto => 'tcp',
    );
    die "cannot connect to the server $!\n" unless $socket;
    print "connected to the server\n";
     
    # data to send to a server
    my $req = 'hello world';
    my $size = $socket->send($req);
    print "sent data of length $size\n";

    # create visualization of battle field
    my @row1 = qw(0 0 0 1 2);
    my @row2 = qw(1 0 0 0 1);
    my @row3 = qw(2 0 0 0 0);
    my @row4 = qw(1 0 0 1 0);
    my @row5 = qw(0 0 0 0 1);

    my @batField1 = (\@row1, 
                    \@row2, 
                    \@row3, 
                    \@row4, 
                    \@row5);

    my @row1 = qw(0 0 0 1 2);
    my @row2 = qw(1 0 0 0 1);
    my @row3 = qw(2 0 0 0 0);
    my @row4 = qw(1 0 0 1 0);
    my @row5 = qw(0 0 0 0 1);

    my @batField1 = (\@row1, 
                    \@row2, 
                    \@row3, 
                    \@row4, 
                    \@row5);

    print " battle field 1:\n";

    print "  a b c d e\n";

    my $counter = 1;

    foreach my $row(@batField1) {
    	print "$counter ";
    	$counter++;
    	foreach my $value(@$row) {
            
    		print "$value ";
    	}
    	print "\n";
    }


    print "-------------\n";

    print " battle field 2:\n";

    print "  a b c d e\n";

    my $counter = 1;

    foreach my $row(@batField1) {
    	print "$counter ";
    	$counter++;
    	foreach my $value(@$row) {
    		print "$value ";
    	}
    	print "\n";
    }
     
    # notify server that request has been sent

  my $response = "";
  $socket->recv($response, 1024);
  print "$response\n";

  my $numDice = "";
  $socket->recv($numDice, 1024);
  print "$numDice\n";

  if ($numDice eq "1" || $numDice eq "3" || $numDice eq "5") {
    print "Player 1 goes first\n";
    print "Enter"
  } else {
    print "Player 2 goes first\n";
  }

             

  shutdown($socket, 1);










   
     
    # receive a response of up to 1024 characters from server

     
    $socket->close();
