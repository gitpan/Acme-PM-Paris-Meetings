package Acme::PM::Paris::Meetings;

use warnings;
use strict;

use DateTime::Format::ICal;

=head1 NAME

Acme::PM::Paris::Meetings - Get the date/time of the next Paris.pm meeting!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

One-liner:

    perl -MAcme::PM::Paris::Meetings -e "print Acme::PM::Paris::Meetings->recurrence->next"

Longer:

    use DateTime;
    use Acme::PM::Paris::Meetings;

    my $rec = Acme::PM::Paris::Meetings->recurrence();
    my $dt = $rec->next(DateTime->now(time_zone => 'Europe/Paris'));
    ...

=head1 FUNCTIONS


=head2 recurrence

Returns a DateTime::Set from which you can get the date/time of the next Paris.pm meeting.

=cut

sub recurrence
{
    DateTime::Format::ICal->parse_recurrence(
        recurrence => ical(),
        dtstart => DateTime->now(time_zone => 'Europe/Paris')
                           ->truncate(to => 'day')
    );
}

=head2 ical

Returns the current ICal expression for the next Paris.pm meeting.

=cut

sub ical {
	'FREQ=MONTHLY;BYDAY=2WE;BYHOUR=20;BYMINUTE=0;BYSECOND=0;COUNT=12'
}

=head1 AUTHOR

Olivier MenguE<eacute>, C<< <dolmen at cpan.org> >>

=head1 BUGS

Let's hope a recent release of the module has been released and you are using it!

You can still check L<http://paris.mongueurs.net> before visiting us.

Please report any bugs or feature requests to C<bug-acme-pm-paris-meetings at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-PM-Paris-Meetings>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Acme::PM::Paris::Meetings


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-PM-Paris-Meetings>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Acme-PM-Paris-Meetings>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Acme-PM-Paris-Meetings>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-PM-Paris-Meetings/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Olivier MenguE<eacute>, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Acme::PM::Paris::Meetings
