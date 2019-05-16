package NoPaste::Web::C::Page;
use strict;
use warnings;
use utf8;
use NoPaste::Repository::Text;
use DBIx::Handler;

sub get_root {
    my ($class, $c, $args) = @_;

    return $c->render('form.tx', {
        action => '/',
        button => 'create',
    });
};

sub get_id {
    my ($class, $c, $args) = @_;
    my $dbh = $c->handler->dbh;
    my $id = $args->{id};

    my $text = NoPaste::Repository::Text->fetch_by_id($dbh, $id)
        or return $c->res_404;

    $c->fillin_form({text => $text});
    return $c->render('form.tx', {
        action => "/$id",
        button => 'update',
    });
};

sub post_root {
    my ($class, $c, $args) = @_;
    my $dbh = $c->handler->dbh;

    my $text = $c->req->parameters->{text}
        or return $c->res_400;
    
    my $id = NoPaste::Repository::Text->create($dbh, $text);

    return $c->redirect("/$id");
};

sub post_id {
    my ($class, $c, $args) = @_;
    my $dbh = $c->handler->dbh;
    my $id = $args->{id};

    my $text = $c->req->parameters->{text} or return $c->res_400;
    my $old_text = NoPaste::Repository::Text->fetch_by_id($dbh, $id) or return $c->res_404;

    NoPaste::Repository::Text->update($dbh, $id, $text);

    return $c->redirect("/$id");
};

1;
