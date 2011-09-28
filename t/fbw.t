use Modern::Perl;
use Test::More tests => 1;

like(qx{bin/fbw 2>&1},qr/Usage:/,'fbw program runs');