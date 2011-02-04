use strict;
use warnings;
use utf8;
use Test::More;
use Data::Page::NoTotalEntries;

subtest 'normal' => sub {
    my $pager = Data::Page::NoTotalEntries->new(
        has_next         => 1,
        entries_per_page => 10,
        current_page     => 3,
    );
    is $pager->next_page(),     4;
    is $pager->prev_page(),     2;
    is $pager->previous_page(), 2;
};

subtest 'first page' => sub {
    my $pager = Data::Page::NoTotalEntries->new(
        has_next         => 1,
        entries_per_page => 10,
        current_page     => 1,
    );
    is $pager->next_page(),     2;
    is $pager->prev_page(),     undef;
    is $pager->previous_page(), undef;
};

subtest 'last page' => sub {
    my $pager = Data::Page::NoTotalEntries->new(
        has_next         => 0,
        entries_per_page => 10,
        current_page     => 99,
    );
    is $pager->next_page(),     undef;
    is $pager->prev_page(),     98;
    is $pager->previous_page(), 98;
};

done_testing;

