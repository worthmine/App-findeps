use strict;
use warnings;

use Test::More 0.98 tests => 4;
use Directory::Iterator;

subtest "eval" => sub {
    plan tests => 3;
    my $list = Directory::Iterator->new('t/scripts/03');
    while ( $list->next ) {
        my $file = $list->get;
        my $done = qx"$^X script/findeps $file 2>/dev/null";
        chomp $done;
        is $done, 'Dummy', "succeed to ignore quoted by 'eval'";
    }
};

subtest "POD" => sub {
    plan tests => 2;
    my $list = Directory::Iterator->new('t/scripts/04');
    while ( $list->next ) {
        my $file = $list->get;
        my $done = qx"$^X script/findeps $file";
        chomp $done;
        is $done, 'Dummy', "succeed to ignore 'Nothing.pm' in POD";
    }
};

subtest "HERE" => sub {
    plan tests => 3;
    my $list = Directory::Iterator->new('t/scripts/05');
    while ( $list->next ) {
        my $file = $list->get;
        my $done = qx"$^X script/findeps $file";
        chomp $done;
        is $done, 'Dummy', "succeed to ignore 'HERE.pm' in here document";
    }
};

subtest "if/unless" => sub {
    plan tests => 7;
    my $list = Directory::Iterator->new('t/scripts/06');
    while ( $list->next ) {
        my $file = $list->get;
        my $done = qx"$^X script/findeps $file 2>/dev/null";
        chomp $done;
        is $done, 'Dummy', "succeed to ignore 'require' inside of `if` or `unless`";
    }
};

done_testing;
