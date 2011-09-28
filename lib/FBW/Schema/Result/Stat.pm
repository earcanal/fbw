package FBW::Schema::Result::Stat;
use parent qw/DBIx::Class::Core/;
__PACKAGE__->table('stat');
__PACKAGE__->add_columns(qw/id stat_type_id fixture_id player_id value/);
__PACKAGE__->set_primary_key(qw/id/);
1;
