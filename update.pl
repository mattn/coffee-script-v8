use strict;
use warnings;
use LWP::UserAgent;
use File::Slurp;

my $src = shift;

my $lines = read_file('coffee.cc', { binmode => ':raw' });
$lines = substr($lines, 0, index($lines, "// DO NOT EDIT\n")+15);

my $content;
if ($src) {
  $content = read_file($src, { binmode => ':raw' });
} else {
  my $ua = LWP::UserAgent->new;
  my $res = $ua->get('https://raw.github.com/jashkenas/coffee-script/master/extras/coffee-script.js');
  die $res->status_line unless $res->is_success;
  $content = $res->decoded_content;
}
$lines .= join("\n", map { s/([\\"])/\\$1/g; "\"$_\"" } split(/\n/, $content)) . ";\n";

rename 'coffee.cc', 'coffee.cc.orig';
write_file 'coffee.cc', {binmode => ':raw'}, $lines;
