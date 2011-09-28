package FBW::Schema::Result::Aka;
use parent qw/DBIx::Class::Core/;
__PACKAGE__->load_components(qw/InflateColumn::DateTime/);
__PACKAGE__->table('aka');
__PACKAGE__->add_columns(qw/id name playerid/);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(player => 'FBW::Schema::Result::Player','playerid');
1;
