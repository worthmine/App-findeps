requires 'perl', '5.012001';

requires 'FastGlob',   '1.5';
requires 'List::Util', '1.55';

on 'test' => sub {
    requires 'Test::More', '1.302181';
};

