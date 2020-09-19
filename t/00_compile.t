use strict;
use warnings;

use Test::More 0.98;
use lib 'lib';
use_ok $_ for qw(App::findeps);

chdir('./t/scripts');
my @files = glob "*.pm *.pl";
chdir('../../');

for my $file (@files) {
    my $done = `./script/findeps t/scripts/$file`;
    chomp $done;
    is $done, 'Dummy', "succeed to detect 'Dummy'";
}

done_testing;
