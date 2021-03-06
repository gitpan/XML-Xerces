# Before `make install' is performed this script should be runnable
# with `make test'. After `make install' it should work as `perl
# DOMWriter.t'

######################### We start with some black magic to print on failure.

END {ok(0) unless $loaded;}

use Carp;

# use blib;
use XML::Xerces;
use Test::More tests => 3;
use Config;

use vars qw($loaded);
use strict;

$loaded = 1;
ok($loaded, "module loaded");

######################### End of black magic.

# Create a couple of identical test documents
my $document = q[<?xml version="1.0" encoding="UTF-8" standalone="no" ?><contributors>
	<person Role="manager">
		<name>Mike Pogue</name>
		<email>mpogue@us.ibm.com</email>
	</person>
	<person Role="developer">
		<name>Tom Watson</name>
		<email>rtwatson@us.ibm.com</email>
	</person>
	<person Role="tech writer">
		<name>Susan Hardenbrook</name>
		<email>susanhar@us.ibm.com</email>
	</person>
</contributors>];

my $dom = XML::Xerces::XercesDOMParser->new();
my $impl = XML::Xerces::DOMImplementationRegistry::getDOMImplementation('LS');
my $writer = $impl->createDOMWriter();
# $writer->setNewLine(0);
# $writer->setEncoding(0);
my $handler = XML::Xerces::PerlErrorHandler->new();
$dom->setErrorHandler($handler);
eval{$dom->parse(XML::Xerces::MemBufInputSource->new($document))};
XML::Xerces::error($@) if $@;

my $target = XML::Xerces::MemBufFormatTarget->new();
my $doc = $dom->getDocument();
$writer->writeNode($target,$doc);
my $output = $target->getRawBuffer();

ok($output, "output written");
is($output, $document, "got expected document");


