# Before `make install' is performed this script should be runnable
# with `make test'. After `make install' it should work as `perl
# StdInInputSource.t'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Carp;
use XML::Xerces;

use lib 't';
use TestUtils qw(result
		 is_object
		 $DOM
		 $PERSONAL_NO_DOCTYPE
		 $PERSONAL_NO_DOCTYPE_FILE_NAME);
use vars qw($i $loaded);
use strict;

$loaded = 1;
$i = 1;
result($loaded);

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

open(STDIN, $PERSONAL_NO_DOCTYPE_FILE_NAME)
  or die "Couldn't open $PERSONAL_NO_DOCTYPE_FILE_NAME for reading";
my $is = XML::Xerces::StdInInputSource->new();
result(is_object($is)
       && $is->isa('XML::Xerces::InputSource')
       && $is->isa('XML::Xerces::StdInInputSource')
      );

$DOM->parse($is);
my $serialize = $DOM->getDocument->serialize;
result($serialize eq $PERSONAL_NO_DOCTYPE);
