#timezone.pl
#!/usr/bin/perl -w
use POSIX qw[tzset];
use POSIX qw(strftime);

        $ENV{'TZ'} = 'Asia/Calcutta';
        tzset();

        $clear_string=`clear`;
        print $clear_string;

        printf("\t\t\tIST TIMEZONE SET\n\n");

        $datestring = strftime "%a %b %e %H:%M:%S %Y", localtime;

        printf("\tDate and time - $datestring\n");

        $datecmp = strftime "%d%m", localtime;

        #This part reads the file line by line

        my $filename = '/home/srivasta/birthday_Mailer/birthday.txt';
        open (my $fh,'<:encoding(UTF-8)',$filename)
        or die "Could not open file '$filename' $!";

        while (my $row = <$fh>) {

                chomp($row);
                my($birthdayperson,$birthdate,$timezone,$gender,$email,$cclist)=split /:/,$row;

                if ($birthdate == $datecmp){
                       printf("\t$birthdayperson has birthday today");
                       printf("\n\tRemember to Wish $gender a very Happy Birthday\n");

                       # Below block of code sends mail to the intended Receipent

                        open(MAILPIPE,"|/bin/mailx -s 'Happy Birthday to You' -c $cclist $email") or die "can't open $!";
                        print MAILPIPE "Dear, Wishing you a Very happy Birthday. Enjoy the day\n";
                        close MAILPIPE;
                }
        }