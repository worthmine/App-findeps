requires 'perl', '5.012001';

requires 'List::Util',          '1.55';
requires 'ExtUtils::Installed', '2.18';
requires 'FastGlob',            '1.5';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

