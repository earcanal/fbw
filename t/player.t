use Modern::Perl;
use Test::More tests => 5;
BEGIN { use_ok('FBW::Schema'); use_ok('FBW::Schema::Result::Player'); }

my $dsn        = 'DBI:mysql:database=fbw;host=localhost';
my $user       = 'paul';
my $pass       = '';
my %dbi_params = (RaiseError=>0);
my $schema     = FBW::Schema->connect($dsn,$user,$pass,\%dbi_params);
my($p)         = $schema->resultset('Player')->search({id => 7});
ok($p->can('id'),'A player can id()');
ok($p->can('aka'),'A player can aka()');
my @aka = $p->aka;
is($aka[0]->name,'The Wall','aka() using Moose');
