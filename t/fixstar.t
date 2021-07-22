
use Test::More tests => 39;

BEGIN { use_ok("SwissEph") };

#------------------------------------------------------------------------
# Sun for 2451544.5 ET : Longitude should be 279.858461
#------------------------------------------------------------------------
my $ref;
my $i;
my @xx;
my $serr="";


#------------------------------------------------------------------------
# Wrapper for swe_fixstar
#------------------------------------------------------------------------
SwissEph::swe_set_ephe_path("/home/ephe:/home/ephe2");

$ref = SwissEph::swe_fixstar_mag("alcyone");
is($ref->{retval}, 0, "swe_fixstar_mag(Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar_mag(Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar_mag(Alcyone)->starname");
is(round_4($ref->{dmag}), 2.87, "swe_fixstar_mag(Alcyone)->dmag");

$ref = SwissEph::swe_fixstar("alcyone", 2415020.5, 4);
is($ref->{retval}, 4, "swe_fixstar(1900, Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar(1900, Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar(1900, Alcyone)->starname");
is(round_4($ref->{xx}->[0]), 58.6052, "swe_fixstar(1900, Alcyone)->xx[0]");
is(round_4($ref->{xx}->[2]), 25496153.13, "swe_fixstar(1900, Alcyone)->xx[2]");

$ref = SwissEph::swe_fixstar_ut("alcyone", 2415020.5-SwissEph::swe_deltat(2415020.5), 4);
is($ref->{retval}, 4, "swe_fixstar_ut(1900, Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar_ut(1900, Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar_ut(1900, Alcyone)->starname");
is(round_4($ref->{xx}->[0]), 58.6052, "swe_fixstar_ut(1900, Alcyone)->xx[0]");
is(round_4($ref->{xx}->[2]), 25496153.13, "swe_fixstar_ut(1900, Alcyone)->xx[2]");

$ref = SwissEph::swe_fixstar2("alcyone", 2415020.5, 4);
is($ref->{retval}, 4, "swe_fixstar2(1900, Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar2(1900, Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar2(1900, Alcyone)->starname");
is(round_4($ref->{xx}->[0]), 58.6052, "swe_fixstar2(1900, Alcyone)->xx[0]");
is(round_4($ref->{xx}->[2]), 25496153.13, "swe_fixstar2(1900, Alcyone)->xx[2]");

$ref = SwissEph::swe_fixstar2_ut("alcyone", 2415020.5-SwissEph::swe_deltat(2415020.5), 4);
is($ref->{retval}, 4, "swe_fixstar2_ut(1900, Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar2_ut(1900, Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar2_ut(1900, Alcyone)->starname");
is(round_4($ref->{xx}->[0]), 58.6052, "swe_fixstar2_ut(1900, Alcyone)->xx[0]");
is(round_4($ref->{xx}->[2]), 25496153.13, "swe_fixstar2_ut(1900, Alcyone)->xx[2]");

$ref = SwissEph::swe_fixstar2_mag("alcyone");
is($ref->{retval}, 0, "swe_fixstar2_mag(Alcyone)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_fixstar2_mag(Alcyone)->serr = $ref->{serr}\n";
}
is($ref->{starname}, "Alcyone,etTau", "swe_fixstar2_mag(Alcyone)->starname");
is(round_4($ref->{dmag}), 2.87, "swe_fixstar2_mag(Alcyone)->dmag");

$ref = SwissEph::swe_pheno(2415020.5, 3, 4);
is($ref->{retval}, 4, "swe_pheno(1900, Venus)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_pheno(1900, Venus)->serr = $ref->{serr}\n";
}
is(round_4($ref->{phase_angle}), 36.7449, "swe_pheno(1900, Venus)->phase_angle");
is(round_4($ref->{phase}), 0.9007, "swe_pheno(1900, Venus)->phase");
is(round_4($ref->{elongation}), 26.2712, "swe_pheno(1900, Venus)->elongation");
is(round_4($ref->{disc_diameter}), 0.0032, "swe_pheno(1900, Venus)->disc_diameter");
is(round_4($ref->{magnitude}), -3.9102, "swe_pheno(1900, Venus)->magnitude");
is(round_4($ref->{hor_parallax}), 0, "swe_pheno(1900, Venus)->hor_parallax");
is(round_4($ref->{attr}->[0]), 36.7449, "swe_pheno(1900, Venus)->attr[0]");

$ref = SwissEph::swe_pheno_ut(2415020.5 - SwissEph::swe_deltat(2415020.5), 3, 4);
is($ref->{retval}, 4, "swe_pheno_ut(1900, Venus)->retval");
if (exists($ref->{serr})) {
  print STDERR "swe_pheno_ut(1900, Venus)->serr = $ref->{serr}\n";
}
is(round_4($ref->{phase_angle}), 36.7449, "swe_pheno_ut(1900, Venus)->phase_angle");
is(round_4($ref->{phase}), 0.9007, "swe_pheno_ut(1900, Venus)->phase");
is(round_4($ref->{elongation}), 26.2712, "swe_pheno_ut(1900, Venus)->elongation");
is(round_4($ref->{disc_diameter}), 0.0032, "swe_pheno_ut(1900, Venus)->disc_diameter");
is(round_4($ref->{magnitude}), -3.9102, "swe_pheno_ut(1900, Venus)->magnitude");
is(round_4($ref->{hor_parallax}), 0, "swe_pheno_ut(1900, Venus)->hor_parallax");
is(round_4($ref->{attr}->[0]), 36.7449, "swe_pheno_ut(1900, Venus)->attr[0]");


sub round6 {
  return sprintf( "%.0f", 1000000 * shift);
}

sub round_4 {
  my $a = shift;
  $a = int(10000 * ($a + 0.00005));
  return $a / 10000.0;
}    
