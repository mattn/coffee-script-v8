use strict;
use warnings;
use LWP::Simple;
use File::Slurp;

my $lines = read_file('coffee.cc', { binmode => ':raw' });
$lines = substr($lines, 0, index($lines, "// DO NOT EDIT\n")+15);

my $res = get('http://coffeescript.org/extras/coffee-script.js');
$lines .= join("\n", map { s/([\\"])/\\$1/g; "\"$_\"" } split(/\n/, $res)) . ";\n";

rename 'coffee.cc', 'coffee.cc.orig';
write_file 'coffee.cc', {binmode => ':raw'}, $lines;
