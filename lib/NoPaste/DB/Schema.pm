package NoPaste::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'NoPaste::DB::Row';

table {
    name 'texts';
    pk 'id';
    columns qw(id text);
};

1;
