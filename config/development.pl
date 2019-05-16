use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath = File::Spec->catfile($basedir, 'db', 'development.db');
+{
    'dbi' => [
        'dbi:mysql:host:mysql:dbname=nopaste',
        'nopaste',
        'amon2', # NO PASS!!!
        {
           RootClass => 'DBIx::Sunny' 
        }
    ],
};