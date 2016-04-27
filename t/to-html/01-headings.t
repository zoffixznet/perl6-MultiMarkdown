use lib 'lib';
use Test;
use MultiMarkdown;

subtest {
    my $html = MultiMarkdown.to-html: q:to/END/;
    # h1
    ## h2
    ### h3
    #### h4
    ##### h5
    ###### h6
    END

    is $html, q:to/END/, 'hashmarks only parse looks correct';
    <h1>h1</h1>
    <h2>h2</h2>
    <h3>h3</h3>
    <h4>h4</h4>
    <h5>h5</h5>
    <h6>h6</h6>
    END
}, 'prefix hashmarks only';

subtest {
    my $html = MultiMarkdown.to-html: q:to/END/;
    # h1 #
    # h1 ######
    # h1 ##
    # h1 ###########
    ## h2 ##
    ## h2 ######
    ## h2 #
    ## h2 ###########
    ### h3 ###
    ### h3 ######
    ### h3 #
    ### h3 ###########
    #### h4 ####
    #### h4 ######
    #### h4 #
    #### h4 ###########
    ##### h5 #####
    ##### h5 ######
    ##### h5 #
    ##### h5 ###########
    ###### h6 ######
    ###### h6 #####
    ###### h6 #
    ###### h6 ###########
    END

    is $html, q:to/END/, 'hashmarks with ending hashmarks parse looks correct';
    <h1>h1</h1>
    <h2>h2</h2>
    <h3>h3</h3>
    <h4>h4</h4>
    <h5>h5</h5>
    <h6>h6</h6>
    END
}, 'prefix hashmarks with ending hashmarks';

subtest {
    my $html = MultiMarkdown.to-html: q:to/END/;
    h1
    =
    h1
    ==============================
    h2
    -
    h2
    ------------------------------
    END

    is $html, q:to/END/, 'underline parse looks correct';
    <h1>h1</h1>
    <h1>h1</h1>
    <h2>h2</h2>
    <h2>h2</h2>
    END
}, 'underline-style headings';

done-testing;
