package NoPaste::Repository::Text;
use strict;
use warnings;
use utf8;

my $index = 0;
my $texts = ['this is a sample!'];

sub fetch_by_id {
    my ($class, $dbh, $id) = @_;

    my $obj = $dbh->select_one(
        'SELECT text FROM texts WHERE id = ?',
        $id,
    );

    return $obj;
}

sub create {
    my ($class, $dbh, $text) = @_;

    my $obj = $dbh->query(
        'INSERT INTO texts (text) VALUES (?)',
        $text,
    );
    return $dbh->last_insert_id;
}

sub update {
    my ($class, $dbh, $id, $text) = @_;

    my $obj = $dbh->query(
        'UPDATE texts SET text = ? WHERE id = ?',
        $text,
        $id,
    );
}

1;